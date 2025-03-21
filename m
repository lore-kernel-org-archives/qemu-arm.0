Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp381547njc;
        Fri, 21 Mar 2025 08:05:29 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVsp9py14azpX3ulsrwvDFWpPOrW+1yJbA7lkMX3cTHp1SMrtD24ju3aOQbKBbmTKIaxFhjcrWek3tRuw==@linaro.org
X-Google-Smtp-Source: AGHT+IH3hda2bA1mxurMDKeawW2sNaC9CCx2+QhCmGZL2Od0qSQ4JiuPQ9dDRnv3vnnYxJuCYVWO
X-Received: by 2002:a05:620a:4588:b0:7c5:5909:18ca with SMTP id af79cd13be357-7c5ba19023fmr515855385a.26.1742569529057;
        Fri, 21 Mar 2025 08:05:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742569529; cv=none;
        d=google.com; s=arc-20240605;
        b=PfFeN7fov7e1FD7OqB4Ks9LSQPlf5LYbuf1alv9CxLAMpFyDUEw7fpNndxmGMwqjRr
         AdseU8Wb6kTF9t1HSxOeavYEotqqkyECHrdLLH/oZYs1V1sCIdKpmImkoPwY8tZW8FmB
         jyqg544hCs50nm9Ojaj3gMNaMKetE6x9aBZB0pnEcj3bARH7TsRsHcQ5EsaHCxDmPm1Z
         hzzjt5jErkkQYuNmUDt8LxXWuoUAL+eTYDJdvDMC492imPVm/PS0tlBfuswlLI4hdsU7
         Fu3TveydbTGWEVuJJ6x2pMMCY0teO1JLVWbL8hhL8LjKl48WvSau6VVw4pcRBsni1OfZ
         iZLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=mime-version:message-id:date:user-agent:references:organization
         :in-reply-to:subject:cc:to:from:dkim-signature;
        bh=5R+ajQwnCzOTnEk7/Bcr1/crlPPyRTCprYEV/8jk2A8=;
        fh=Os6bOJX8NNd8nTecMiYpYmU1dwrK2S4cq+Zk1WZZsoc=;
        b=U8mwAME0YQpNdyGCoDc4fOm1qHD1LyUu9Yvh8uwGJFTqhE2kTKlvAz9CIDaVMHGjWS
         Moex7MfZLpv5AviGuXQuGzPgOL7RxLXjvKqH7TKFQ1qWbT5h19dgEcsBAzOEWIeh8Ru+
         DpXfGQQFpEElB9G/kaxVGJBnX8Dw1x8O23a1UlTuh763uhGmGRYpafU3QEwU8W48z+wS
         zcgwitGM7DPvt7rHpP0r61psL2TdC9vt4LBy0dsxMtBU9J0hviUMUzlc/KvE9jcmIy1s
         Fp3tUu94y4CkOt9+FoBkxcm7/DAiceeLo/JDCRpLx1ndHUMkBlZ5SmgVpqkMcBYP5Jef
         rmOw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WR5UjkfQ;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <cohuck@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id af79cd13be357-7c5b93474e5si215703785a.273.2025.03.21.08.05.28
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 08:05:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of cohuck@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WR5UjkfQ;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742569528;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5R+ajQwnCzOTnEk7/Bcr1/crlPPyRTCprYEV/8jk2A8=;
	b=WR5UjkfQE/ayQEXSY7NV0YoL3jLhd0Uzr4i0ua2svf3NWZtK3wStFACdEzDNhhZyOM4QH4
	r8PUuxC+rY/eQ/lzPCMDl/0bA5YlYAf5VPu5JXUajrv8R+2yimvOIgzC8Wv//LbIvaczCg
	Rekn8QGcGTvvPklWJg//7Umca/sW8Dw=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-137-LzjtJHa7P2S4k7YUT17pWg-1; Fri,
 21 Mar 2025 11:05:24 -0400
X-MC-Unique: LzjtJHa7P2S4k7YUT17pWg-1
X-Mimecast-MFC-AGG-ID: LzjtJHa7P2S4k7YUT17pWg_1742569522
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6CC06180AF6C;
	Fri, 21 Mar 2025 15:05:21 +0000 (UTC)
Received: from localhost (unknown [10.67.24.51])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 158E81828A83;
	Fri, 21 Mar 2025 15:05:18 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Marc Zyngier <maz@kernel.org>
Cc: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, kvmarm@lists.linux.dev, peter.maydell@linaro.org,
 richard.henderson@linaro.org, alex.bennee@linaro.org,
 oliver.upton@linux.dev, sebott@redhat.com,
 shameerali.kolothum.thodi@huawei.com, armbru@redhat.com,
 berrange@redhat.com, abologna@redhat.com, jdenemar@redhat.com,
 agraf@csgraf.de, shahuang@redhat.com, mark.rutland@arm.com,
 philmd@linaro.org, pbonzini@redhat.com
Subject: Re: [PATCH v3 00/14] arm: rework id register storage
In-Reply-To: <86plino2ru.wl-maz@kernel.org>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Michael O'Neill, Amy
 Ross"
References: <20250311162824.199721-1-cohuck@redhat.com>
 <86plino2ru.wl-maz@kernel.org>
User-Agent: Notmuch/0.38.3 (https://notmuchmail.org)
Date: Fri, 21 Mar 2025 16:05:12 +0100
Message-ID: <871puqv2zb.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-TUID: wK5sjzk6ejJ+

On Tue, Mar 11 2025, Marc Zyngier <maz@kernel.org> wrote:

> On Tue, 11 Mar 2025 16:28:10 +0000,
> Cornelia Huck <cohuck@redhat.com> wrote:
>> 
>>   - I'm open to changing the source of the definitions from the sysregs
>>     file to the JSON definitions published by Arm; however, I first wanted
>>     to get the code using it right -- we can switch out the code generating
>>     the file to use a different source easily later on, and I'd also like
>>     to steal parts of the script from Linux once integrated (which I think
>>     hasn't happened yet?)
>
> I don't think there is a real appetite to have that script merged in
> the kernel. My current plan is to maintain it separately.
>
> But by any mean, take it and do whatever you want with it.

Thanks for the info; I'll look at it again once the rest of this series
here is done.
