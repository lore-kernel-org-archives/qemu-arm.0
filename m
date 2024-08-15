Received: by 2002:a17:504:9188:b0:1be9:327d:8ee3 with SMTP id i8csp875537njf;
        Thu, 15 Aug 2024 07:29:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG4qE6yJ+rkeN8tPILSfPDLuYKM4ropz6eIkhiQMwkvkV8W7VW0u7fyP+KvHBvAxKJ2EPAE
X-Received: by 2002:ac8:5396:0:b0:453:5e98:9aa6 with SMTP id d75a77b69052e-4535e989cfemr54413231cf.42.1723732142176;
        Thu, 15 Aug 2024 07:29:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723732142; cv=none;
        d=google.com; s=arc-20160816;
        b=AXfFpKrUN2Zuq6QLQIV2Sw33RVHSWvt25vPvlaZ14ohAAVpSm2BByv4sPK32093ebq
         yjve6tN0S2GRod3yfOLjAZ18C2ov/955IMKbhVRHV8b+LE2hm/wygjXN/rNOQBQeNGdE
         pkm1zK2Y+I9RO5DTXFatNkonULjf/vy7kgQifSp++n7qNhHv8rZ7NkgeofwDRu2jL6R8
         vDAzT6YbL7JL6gInaG/qbmDZg/QVV/VF5jF7VseRizsIrGA+WJxZnEkXcTUt3FWfLYqV
         cORUzknXIDWSgDsrtOyhE/bvl3Hd+L7QidUatIP4mP5V0xsFAaRgcs5ChZRUiDjYPdyn
         CdPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-disposition:in-reply-to:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=pLW8VxYvBfkl9d6XaUqzmKjRXnbivJG5S8ggECncIC4=;
        fh=7PYBkNaQxyBUW8FT7Cv5hEQwAeXvtqaGUCDeGRr+SFA=;
        b=KyiWG9iZ7zZkLxMOhQpXuYCqsBSewXUsx2qS8z3vDN+9XMAA9HzR+9g+7vXR9JZfB9
         eXFu/kEOjs/p4A5EWDNrpzm4/LTSLlSLkwVA9+6POvzSRwmiVL//x6xdGuCP31PGU2x2
         GkQDq3/XiywRrlWTvFmmWPN1b3zhTR5/WmJHcIlhVl2VN3b4P6pv1LRvLuBZJHFIb3NO
         ZqL7Bo13xzqbaYPN6JJtJGpOHVCmrHqTP7cOfe1st5UIYI2l/ktpftDA6KnmbL8uJ1/7
         +IKYTIxerDYDjEOdblY9p5Ztj+xKLJzs0eEa0j294ScBQyWpRL1MkqnMvLrLG2cTi7qg
         389w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SIggje21;
       spf=pass (google.com: domain of mst@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=mst@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <mst@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-45369fe6bf9si18898301cf.49.2024.08.15.07.29.02
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Aug 2024 07:29:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of mst@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SIggje21;
       spf=pass (google.com: domain of mst@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=mst@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723732141;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pLW8VxYvBfkl9d6XaUqzmKjRXnbivJG5S8ggECncIC4=;
	b=SIggje21y0dLwIKRIQooUDD8XYphtx8BGxfSGgqHNgWjwvhueDKzATvDPF1qz4cdRZimcG
	R3BJZIq8PmlyplaXnnnFTDspQsDt3SoYB82L6JpmB3aiwfmT5T+mR9fBaYShzMwbUSCUTw
	CCCv1ds2jDbLZG4zT2WM+TpJCDbE+Kw=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-59-GeuMU2ZVOgaqV5X9nuvE0Q-1; Thu, 15 Aug 2024 10:29:00 -0400
X-MC-Unique: GeuMU2ZVOgaqV5X9nuvE0Q-1
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-5a30be1c5cfso1009245a12.0
        for <alex.bennee@linaro.org>; Thu, 15 Aug 2024 07:29:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723732139; x=1724336939;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pLW8VxYvBfkl9d6XaUqzmKjRXnbivJG5S8ggECncIC4=;
        b=EovEnbpKzGbuT1fpsZrPIsZ1xfK5q+ucHDUPJeE5JB/SCT3ifk0YAfwv8J/5pTecKb
         zahZ2WJ8jMa/lNNcFLZAdx6E0NaU16TNL12yfG1qMaESExOTEY+arLFRK2nwNjkVHWeN
         D3+rpPns/xmXU4o3KxoGYj/8Ewco692OliWoqmIjSojhJRkfWaoZ7bSUqpiwrqgxYb48
         lqgi/jHoQVbkdcF0fSqrOlcoV88PCCsTwnGbegWYZbR6C/HTlT6gXAUrSmL4mel59mmQ
         gUifc5f5ijvdIEJPsNuoZskV5BINZ78RQibDHGGU7XasnpAIJqx4n/YShNhp45Z5E3ZG
         MaPA==
X-Gm-Message-State: AOJu0YwaQ9LfxZX/zS2i5JCmPdKJoo8k45YNvsG+K37ewpUutsh7N2IC
	qns+/OfhnocvJzC4o0zuNEWiJthmHhwKSGAgUJmWTwB7cBM//I08u94cWI1+BxLZbIgSZNhchFL
	zuqv5lDkeLpV4mhvNfuVRO1NlesE2+uhFLA6Y+juEHEdl2nJ+M/586w==
X-Received: by 2002:a05:6402:e83:b0:5be:b6ae:dc68 with SMTP id 4fb4d7f45d1cf-5beb6aee07amr1903239a12.10.1723732139480;
        Thu, 15 Aug 2024 07:28:59 -0700 (PDT)
X-Received: by 2002:a05:6402:e83:b0:5be:b6ae:dc68 with SMTP id 4fb4d7f45d1cf-5beb6aee07amr1903190a12.10.1723732138674;
        Thu, 15 Aug 2024 07:28:58 -0700 (PDT)
Return-Path: <mst@redhat.com>
Received: from redhat.com ([2a02:14f:178:8f0f:2cfe:cb96:98c4:3fd0])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bebc081a24sm938598a12.95.2024.08.15.07.28.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Aug 2024 07:28:58 -0700 (PDT)
Date: Thu, 15 Aug 2024 10:28:51 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Nicholas Piggin <npiggin@gmail.com>
Cc: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
	Michael Roth <michael.roth@amd.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Weiwei Li <liwei1518@gmail.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	=?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Eric Auger <eric.auger@redhat.com>, Song Gao <gaosong@loongson.cn>,
	qemu-arm@nongnu.org, Peter Xu <peterx@redhat.com>,
	Jiri Pirko <jiri@resnulli.us>, Eric Blake <eblake@redhat.com>,
	Fabiano Rosas <farosas@suse.de>, qemu-s390x@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	John Snow <jsnow@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
	Konstantin Kostiuk <kkostiuk@redhat.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Cleber Rosa <crosa@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>, qemu-riscv@nongnu.org,
	Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Jason Wang <jasowang@redhat.com>, Bin Meng <bmeng.cn@gmail.com>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
Subject: Re: [PATCH v2 16/21] virtio-net: Use replay_schedule_bh_event for
 bhs that affect machine state
Message-ID: <20240815102754-mutt-send-email-mst@kernel.org>
References: <20240813202329.1237572-1-alex.bennee@linaro.org>
 <20240813202329.1237572-17-alex.bennee@linaro.org>
 <20240813164631-mutt-send-email-mst@kernel.org>
 <D3FEPPLH78YW.3BYA9B4HYGN1U@gmail.com>
 <20240814030308-mutt-send-email-mst@kernel.org>
 <87y14z81ak.fsf@draig.linaro.org>
 <D3GARIYVC16C.20SXVKSIMLED4@gmail.com>
MIME-Version: 1.0
In-Reply-To: <D3GARIYVC16C.20SXVKSIMLED4@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-TUID: Ix81urUhANL3

On Thu, Aug 15, 2024 at 05:12:32PM +1000, Nicholas Piggin wrote:
> Could be a good idea. Although I'm not sure what to do with
> all types, maybe we can restrict what is supported.
> 
> > Is this wider re-factoring something that can wait for the next
> > developer cycle?
> 
> I would say so. It's not quite trivial to do nicely since
> things are a bit tangled between util/async and replay.
> 
> > >> I had started on a conversion once but not completed it.
> > >> I could resurrect if there is agreement on the API?
> >
> > I would certainly welcome it being cleaned up. The supported replay
> > devices are very piecemeal at the moment.
> 
> I'll tidy up and post an RFC for how the new API might look.
> 
> Thanks,
> Nick

Fundamentally it's virtio net, up to Jason. I don't like messy
APIs and people tend to get distracted and not fix them up
if one does not make this a blocker.

-- 
MST
