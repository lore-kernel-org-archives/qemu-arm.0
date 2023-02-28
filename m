Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp5661889ejc;
        Tue, 28 Feb 2023 03:45:45 -0800 (PST)
X-Google-Smtp-Source: AK7set96DOveILicmURw0s9gIV1W1qR2qC/AxeWWRRqfDHhwE/f0ZscKpdlfpqajJ3Ug8RxPy/MB
X-Received: by 2002:a05:622a:1184:b0:3b9:a42b:7099 with SMTP id m4-20020a05622a118400b003b9a42b7099mr4456499qtk.30.1677584745453;
        Tue, 28 Feb 2023 03:45:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677584745; cv=none;
        d=google.com; s=arc-20160816;
        b=cIojApUzrwitB60aihc9WxVYbr/St04skeEya+292Txk+WRl4cVlYKyG4l4YSPMVQJ
         hBOWhX7jBVo+COt2uDRTKWBirxCBWt+XS8SIBKWR5YRxkp4UpRrcenK8AP9jLF05xOqY
         /Z93U0lg86AKWsJjPIPExlWVQzumsHp3Hp6luf5lxif90lMFiQNMsi/DzaeIC3xRSLgO
         7ZVgK/jzD740xmOwqaBluC1cQTALj/ZaocSsAytPfPmjMsn5vtQ1MgD3S6gw+0E4kIok
         /Ei7N2UFdzsxuxE698DuyRhRiNWSQWJVQsSJiTXEH5yPG1NqGeVYPrnTVXsMMtHQD10V
         2+7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-disposition:in-reply-to:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=bpIC6p+UT+rHFct1wlfMFpw0g6TQL7FZQoQ34DKLJ2E=;
        b=D1/IVD35ZEGN+XfeauYnTthmF6m4qbvH3ul5FAyK1rgy0U5KgPK+IH0JlyUqy6PtD4
         tXUdVsMDp/W+yILBZK3XaIPpRRt6oD7qkXYIZA5N5gIEI8qlchyT9lmhHYtMDAp+6iib
         0zOANEHvnnXkjpc+bL3tPDTOCPfVH5ugA1ZwPhoeOwNozi2MdioVKTOUIe9A6GS93Iuh
         g3MxK+6EftlXfFaEaw5/6OJT1lqSsjMIWbEtcH1Ct7SRMKvz0lNBeuinWo6Erwp83bxr
         UR5P+nqbt9MubBdwGg8B+f7vvbqQpDTRHYyJlVK8navOTsEg8CV+xr1WkMQdpIAgVT+e
         7aJg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="PUL8jjB/";
       spf=pass (google.com: domain of mst@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=mst@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <mst@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id p9-20020a05622a00c900b003b86cf0da6bsi8838044qtw.60.2023.02.28.03.45.45
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Feb 2023 03:45:45 -0800 (PST)
Received-SPF: pass (google.com: domain of mst@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="PUL8jjB/";
       spf=pass (google.com: domain of mst@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=mst@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677584745;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bpIC6p+UT+rHFct1wlfMFpw0g6TQL7FZQoQ34DKLJ2E=;
	b=PUL8jjB/s5yd0j7B3EeLJ3hOZG+ASIcQhsDTKat4mz/DdCKwh9+aXCozH1mSMptABqA5aa
	fJ2A/fzkr9v/5Z1U6CniGAcdjjMp1KeRnA+IJa91jx2OM/JsWjJKp6hWbgSKpKHAzWJiCO
	cCaUl+zwTCFfrKYGvNggDVhYWLr0Yp8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-321-nbqk5VZ6N_itXJAW9Iy8BQ-1; Tue, 28 Feb 2023 06:45:43 -0500
X-MC-Unique: nbqk5VZ6N_itXJAW9Iy8BQ-1
Received: by mail-wm1-f70.google.com with SMTP id l16-20020a05600c1d1000b003e77552705cso4146670wms.7
        for <alex.bennee@linaro.org>; Tue, 28 Feb 2023 03:45:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677584742;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bpIC6p+UT+rHFct1wlfMFpw0g6TQL7FZQoQ34DKLJ2E=;
        b=wgDclolYnb0Pp4Atg6BP5FdJomu9q+9XqjxsmJ8A1Ch7uZQAqKDXA0ckdjWlTyJda5
         z805nn1jel/AdF8e9q34x8ql38XliyTZ5IjwYEA001YAiCoTCah7dWQu1J/tfuUYeBZT
         dE6c7nEW2VbRRkdnzIDNQXx6+N67LnZeUayVO/hFnBsz9csDfZ8zd2Sb/vP6dKDgLbgR
         OaXf9kHabGZPIcbBzGuTqtEdgbyv27m8c6QKLZtfbop5fvhRi6oiiWFZyAR7PsHSvZ92
         sVOWH+wUI9lhTkV0qF3K40D2QU+GrmpSH/STBPIm+Em7RUPUetR9z5ixHFl3cg5eg0BJ
         G7RQ==
X-Gm-Message-State: AO0yUKUUxgXGzpgGReg5I02pcgqOz56MG3ou7to6rHHEOIHufUMKiBPu
	ESHuzfxb7jfhEQib4c8+YlQMIZNrpPfGa/sg1c+7LiNZhNjjiug0Djde2OS8tys0VpO9uncASug
	zFk3bY7s5esaCRQa3
X-Received: by 2002:a5d:558d:0:b0:2c7:694:aa18 with SMTP id i13-20020a5d558d000000b002c70694aa18mr1645855wrv.15.1677584742662;
        Tue, 28 Feb 2023 03:45:42 -0800 (PST)
X-Received: by 2002:a5d:558d:0:b0:2c7:694:aa18 with SMTP id i13-20020a5d558d000000b002c70694aa18mr1645837wrv.15.1677584742358;
        Tue, 28 Feb 2023 03:45:42 -0800 (PST)
Return-Path: <mst@redhat.com>
Received: from redhat.com ([2.52.141.194])
        by smtp.gmail.com with ESMTPSA id q5-20020adff505000000b002c70a0e2cd0sm9735429wro.101.2023.02.28.03.45.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Feb 2023 03:45:41 -0800 (PST)
Date: Tue, 28 Feb 2023 06:45:37 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>, libvir-list@redhat.com,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	Reinoud Zandijk <reinoud@netbsd.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	xen-devel@lists.xenproject.org, Paolo Bonzini <pbonzini@redhat.com>,
	Maxim Levitsky <mlevitsk@redhat.com>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH 1/2] docs/about: Deprecate 32-bit x86 hosts and
 qemu-system-i386
Message-ID: <20230228064105-mutt-send-email-mst@kernel.org>
References: <84d7d3e5-0da2-7506-44a7-047ebfcfc4da@redhat.com>
 <20230228031026-mutt-send-email-mst@kernel.org>
 <Y/3CiEKKoG06t9rr@redhat.com>
 <20230228040115-mutt-send-email-mst@kernel.org>
 <fe4626c6-6103-d5e5-6920-9dfb4777b979@redhat.com>
 <Y/3MIUDRBUSNg6C5@redhat.com>
 <20230228050908-mutt-send-email-mst@kernel.org>
 <87cz5uhy50.fsf@pond.sub.org>
 <20230228055016-mutt-send-email-mst@kernel.org>
 <87h6v6gh1g.fsf@pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87h6v6gh1g.fsf@pond.sub.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-TUID: ABY8McVv0316

On Tue, Feb 28, 2023 at 12:34:19PM +0100, Markus Armbruster wrote:
> If it's not worth arguing, then we merge Thomas's patch.

I don't mind but it's just a doc patch isn't it? If what we want to do
is to stop doing make check on a 32 bit container and just to do
make then let's patch the relevant yaml.  I'd ack this, easy.

-- 
MST
