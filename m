Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp2362353dye;
        Mon, 30 Jun 2025 03:04:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWooosjEHYF3bm8ECgOjhbBGfPSQiLCBRXCIbTAotBDvS0Y9MHWXK2ygS151D2CCzxGP+lK7TWvgjkqWA==@linaro.org
X-Google-Smtp-Source: AGHT+IE1FLDwUgNsmQcvlGPCFT0/COCCctC5THR2Mxs2p/JpawsKX8jflIRyyaTJxZPwfttrCuy2
X-Received: by 2002:a05:620a:19a4:b0:7d3:f8bd:f34c with SMTP id af79cd13be357-7d43bba94d8mr2066069685a.10.1751277882741;
        Mon, 30 Jun 2025 03:04:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751277882; cv=none;
        d=google.com; s=arc-20240605;
        b=D40x2cnYHEcHFguClm+w72AYGDjm0gsqouwHr5hPuHy+SIaBXxlyHS2ItQOsq5+5GB
         eeJOCkGlUnCcDV/KAg831U2y0QdgxrllhN9GpsnVt+FnT7qlRtOoJRRGuojWqaVBZA9v
         u/JiqYGmWOdMHy2073YENPSA4cifCX+5c1/k7t9uGTd1UfwKzEREQpBfCGO8SuoNLRl3
         dEH4XEU1OaxKiZpn0UqPF2CHqih3w5wbl2+t4CS5w4pPtxxFP/S9yDtHjVzu3p4Ti+Qv
         4ngjR/SJUzz5Duf+ykLLr9L3vkMnv31XIpr+W4eF23ZZoRJ71z4dJ5kL5WdX9ZRVrpS6
         pZ6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=mime-version:message-id:date:user-agent:references:organization
         :in-reply-to:subject:to:from:dkim-signature;
        bh=rjChr4l7bDoOse0Y08kwZF8ENfM0mEbxnZ8orFyHQAs=;
        fh=4mGvTxkDBcPiBzF8VLXw8EDx1NipcFDb2/iENmYmljw=;
        b=kaPF3bj8TAG2ihFeT5oJIXDuszDHCBMD0uSqRHzd9bz3K8O+WKCRXze3uYzqU3ZVFa
         clBnhf0FwC68Us00cUFUZ0Azjt9DrALgStkmgbwaWv2CjZDrPymOdcVReRoUeM2F3x0c
         JIgROeg6xbeagD9yiXJopITz9ePdOCFE2sZ9es0GPo7Rl6GlOw2flbRvmMtDL8smZqOD
         C1xPuKKqoMs/oW9JYgRYDaHc3g9b7h4Wg9C8OCN7TDdvi/TOMBkJNuaWgSvJ+atbYMBp
         WCNLi0bpPvz+AWsSAMsUlTAyu+woOLME0JddlBvstLspaFaQQX8S3TVdxTBa1vs4Ne67
         D9mA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Jzq+aPp8;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <cohuck@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fd77388586si100481426d6.389.2025.06.30.03.04.42
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 03:04:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of cohuck@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Jzq+aPp8;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751277882;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rjChr4l7bDoOse0Y08kwZF8ENfM0mEbxnZ8orFyHQAs=;
	b=Jzq+aPp8X2RzLLBvsWhjKmHnbxkBi2GI8mKe1CWG9jYytfYJFxruRnEnBwfjHj1xhudSMq
	RntJgp4g3/zYnUOWn/C5GBlQc+HDhB5GsS09eNdDaldhjzoLngTElqtl4j9t8inTbFjEZS
	EDSnPXw1zclffVzNjAQiXqIB3Ju5EZQ=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-597-dE_8xuvEPCeE7rJ1WeK2eg-1; Mon,
 30 Jun 2025 06:04:38 -0400
X-MC-Unique: dE_8xuvEPCeE7rJ1WeK2eg-1
X-Mimecast-MFC-AGG-ID: dE_8xuvEPCeE7rJ1WeK2eg_1751277877
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 03DB61978F63;
	Mon, 30 Jun 2025 10:04:36 +0000 (UTC)
Received: from localhost (dhcp-192-236.str.redhat.com [10.33.192.236])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7ABC918003FC;
	Mon, 30 Jun 2025 10:04:33 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, kvmarm@lists.linux.dev, peter.maydell@linaro.org,
 richard.henderson@linaro.org, alex.bennee@linaro.org, maz@kernel.org,
 oliver.upton@linux.dev, sebott@redhat.com,
 shameerali.kolothum.thodi@huawei.com, armbru@redhat.com,
 berrange@redhat.com, abologna@redhat.com, jdenemar@redhat.com,
 agraf@csgraf.de
Subject: Re: [PATCH v8 00/14] arm: rework id register storage
In-Reply-To: <20250617153931.1330449-1-cohuck@redhat.com>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Avril Crosse O'Flaherty"
References: <20250617153931.1330449-1-cohuck@redhat.com>
User-Agent: Notmuch/0.38.3 (https://notmuchmail.org)
Date: Mon, 30 Jun 2025 12:04:30 +0200
Message-ID: <87jz4tr1e9.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-TUID: wniWE9pbSk0q


On Tue, Jun 17 2025, Cornelia Huck <cohuck@redhat.com> wrote:

> Mostly addressed Peter's feedback:
> - make sure every inbetween stage compiles (also fixed some bonus issues)
> - try to make the scripts more robust, add a note the generated file,
>   and make sure to grab only registers we actually want
>   - I did a half-hearted attempt to use python instead of awk, but I'm
>     out of my depth, especially with the script that will be used for
>     the register fields in the cpu models series
>
> Also available at
> https://gitlab.com/cohuck/qemu/-/commits/arm-rework-idreg-storage-v8

This still seems to apply cleanly... can it go in as-is, or should I
respin to shorten the long line in kvm.c?
