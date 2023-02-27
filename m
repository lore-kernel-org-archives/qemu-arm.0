Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4995061ejc;
        Mon, 27 Feb 2023 12:13:03 -0800 (PST)
X-Google-Smtp-Source: AK7set9ex/srWECLze7J/xs4M1n8NPodUC21gCz6F7O1QF1TBvfRzRAuv//JcJpWD4bUu4eDn5o2
X-Received: by 2002:a05:622a:1355:b0:3ae:189c:7455 with SMTP id w21-20020a05622a135500b003ae189c7455mr670522qtk.47.1677528783256;
        Mon, 27 Feb 2023 12:13:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677528783; cv=none;
        d=google.com; s=arc-20160816;
        b=YLnzrRNldsVr0XiLJ3VC6zJl3a7TTGVtNU5L08UZrWuilmmNmkH9jxkmr1NZF3pJ+q
         //U96NIxA3bALZprOC2WiuuNj/VEOt1RR7QO9Ub0FvvptrKXFUsH9dNqJmcUNTfvoNEF
         3sBwYpolKnOVFMiOnFSK6PB9q4QqGbxUTt7ai6av/UAS6Xefsqbl5MYTyFSXBqQ74djz
         R1mCi9I/2Wh50J4PzmSqbaAmkLgCUptzYkB1Bsko+9uoeaKnhDperqeZNnecX5xU4Y+8
         WzhcCrEuU9rE6qvQqngrCjxbhJLV6M7r9+D9zEKoGkUYIsCWCu/TsG+ChCMb1kkvvSOE
         ivwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=nXo6S0IXEpM+6py6VQyWASTHuOuAAX4yGyZNHQtCjPw=;
        b=Hn2VI5ZxVarzMP6H+SqpSSYXnfPgJtP5FnmTH1ieZF0+i2450UGXr+d25KGEWGUew5
         2/L6yWVFU95CBTTuJKIBkKyaUvt9NCTuQf+4WcklJwd4y5r0M7akwmCpI45UngHeNV4M
         mDUqh3by8HoH3wHzks0jrWLE/gh7Rh58YvBZsw8S/CGLosile2MELHxltF1aFFnpWuLK
         4IsUN9jiFcJG+IATKo2CtpZXTzblk7T+s/x6Omfl6Lz3pWIo2ZNvlwLLh6tLLgv60VBa
         t5XxXtA7c/xMusrv+nrcZcPeQQYZ9TT4jUVm6xxOfd6qmzWfuN4LGEM4vQ3H1MHeGAj2
         jG/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="J/OKaki1";
       spf=pass (google.com: domain of mst@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=mst@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <mst@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id br13-20020a05620a460d00b0073b882ce6efsi7028618qkb.298.2023.02.27.12.13.03
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Feb 2023 12:13:03 -0800 (PST)
Received-SPF: pass (google.com: domain of mst@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="J/OKaki1";
       spf=pass (google.com: domain of mst@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=mst@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677528782;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nXo6S0IXEpM+6py6VQyWASTHuOuAAX4yGyZNHQtCjPw=;
	b=J/OKaki1E4X3lA2+U8GBuQrWfEh9GQ23GVmbd78b3PrTsGR5W9QbXeBu7D1u9ZBoNe/EGv
	AA43U9bdx80pF64TtpfspH5SF9LUSUIo0Uzhf46nSs+Q9lt/nC03QsXJOLp4g7pVpt0vMg
	bmTE50vNQ3/6Cy2ERJ08Y9Ovz+dpuzQ=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-113-wJUbSippMmGFam_THRylTg-1; Mon, 27 Feb 2023 15:13:01 -0500
X-MC-Unique: wJUbSippMmGFam_THRylTg-1
Received: by mail-ed1-f69.google.com with SMTP id v12-20020a056402174c00b004acb5c6e52bso10187254edx.1
        for <alex.bennee@linaro.org>; Mon, 27 Feb 2023 12:13:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nXo6S0IXEpM+6py6VQyWASTHuOuAAX4yGyZNHQtCjPw=;
        b=0fWzad3BRebo/fE/fDaAOe5a9SgrUX56ONjjkEU4l4Fq1uF047Hi39aJqwAx0b8mHy
         aVW+ieIb9qyndLmbeuPovpv5QfPjPg/sNpEkNUpPpl040AwhN/EMQ6kg+nt8lFSCWwZz
         yjj3pE/Do2ikw9qT7vdcIn54eyOpKjJi2kWyUEXUXQUFrETLfJffiuVgmBpnlxBof47v
         E5CmhQXFH2+JaS9fHJHT+WzMBDHW/DygagIux7/OVD75FOHVnxwl3WXitYD/d0H+lDvT
         V5n5boB+QUCrbosCJJKqLF2M7F8Q3Gt5Wh6tWKG2rcpM8+DUQQt7O0RLepyGAv79TTJE
         UUYQ==
X-Gm-Message-State: AO0yUKWwBp7dl+sgCMmDKQtu0s26AlVYmBnp0xQ4VlVmk/VfEHsFvuJU
	Y5idp6j4gswQtKARl84BhdQibZIyIuhV6E6lGQY9V8GqucZIoAjNZMzWaWqbySYpXZxwNeCM8ch
	kJ2GIDDic+UsGXRKG
X-Received: by 2002:aa7:d5d9:0:b0:4aa:a1d4:bbd4 with SMTP id d25-20020aa7d5d9000000b004aaa1d4bbd4mr795785eds.42.1677528780650;
        Mon, 27 Feb 2023 12:13:00 -0800 (PST)
X-Received: by 2002:aa7:d5d9:0:b0:4aa:a1d4:bbd4 with SMTP id d25-20020aa7d5d9000000b004aaa1d4bbd4mr795759eds.42.1677528780354;
        Mon, 27 Feb 2023 12:13:00 -0800 (PST)
Return-Path: <mst@redhat.com>
Received: from redhat.com ([2.52.141.194])
        by smtp.gmail.com with ESMTPSA id v29-20020a50a45d000000b004af70dcce7esm3516370edb.40.2023.02.27.12.12.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Feb 2023 12:12:59 -0800 (PST)
Date: Mon, 27 Feb 2023 15:12:55 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org, Maxim Levitsky <mlevitsk@redhat.com>,
	libvir-list@redhat.com,
	Richard Henderson <richard.henderson@linaro.org>,
	xen-devel@lists.xenproject.org,
	Reinoud Zandijk <reinoud@netbsd.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: Re: [PATCH 1/2] docs/about: Deprecate 32-bit x86 hosts and
 qemu-system-i386
Message-ID: <20230227150858-mutt-send-email-mst@kernel.org>
References: <20230227111050.54083-1-thuth@redhat.com>
 <20230227111050.54083-2-thuth@redhat.com>
 <Y/yY72L9wyjuv3Yz@redhat.com>
MIME-Version: 1.0
In-Reply-To: <Y/yY72L9wyjuv3Yz@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-TUID: gMP8xqRrKeFT

On Mon, Feb 27, 2023 at 11:50:07AM +0000, Daniel P. Berrangé wrote:
> I feel like we should have separate deprecation entries for the
> i686 host support, and for qemu-system-i386 emulator binary, as
> although they're related they are independant features with
> differing impact. eg removing qemu-system-i386 affects all
> host architectures, not merely 32-bit x86 host, so I think we
> can explain the impact more clearly if we separate them.

Removing qemu-system-i386 seems ok to me - I think qemu-system-x86_64 is
a superset.

Removing support for building on 32 bit systems seems like a pity - it's
one of a small number of ways to run 64 bit binaries on 32 bit systems,
and the maintainance overhead is quite small.

In fact, keeping this support around forces correct use of
posix APIs such as e.g. PRIx64 which makes the code base
more future-proof.

-- 
MST
