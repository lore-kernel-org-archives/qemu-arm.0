Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp899579ejs;
        Wed, 10 Jan 2024 00:44:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFprgdF9axFOD8hSTpuAmXWX0Wot4O7NYsMF9SUD7iD3GCRICn7v7TsrD5KwXmubPf+szdt
X-Received: by 2002:a05:622a:182:b0:429:b4ae:bb65 with SMTP id s2-20020a05622a018200b00429b4aebb65mr749327qtw.57.1704876257315;
        Wed, 10 Jan 2024 00:44:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704876257; cv=none;
        d=google.com; s=arc-20160816;
        b=kTska7rIfXQJBjgvT4zorngPjRgVgndQDKqvpcJg93cZtRd81F6QpOVDXht8tF1U8C
         J3IuDkeaXphJWYkGUmBRXc4+YHEzgx754wjkOY+FlBoXWKkPjXrZ05Z6VZXsUDXebUpo
         CyREOtveisfccTLsxamm8LYHn41iaa7jxKXtsMT/53t07UzCYFdQOUpmhwzscdpwSF5Z
         YqGSGHz1rgIXB15w5w/wNBIQRFe9rubpCDqg67fJneykyr67rlpdKoQkcDt6ooZgmZIW
         JLpm73R2mModXUnXpJFKwWIP13qQ24z2rzyj2A0gAfNkUaFydRfzJZym5ggxNouiZT/A
         IJ/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-disposition:in-reply-to:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=609N03LdjpkxAYKf0CfIMFNH4ZnJqwVCDxCBxZ9EZlM=;
        fh=Kis5pzYxYX9ZASkT8rajCHfSMMnzBjKVV/vODd71G44=;
        b=T7C04w/MQvSLyNQV7FC0V/9H/u0o3Ry9Fhtv6Cbmo6n0/WqA7ZW0scIGicJnP3dWpk
         oLojF4V/TPIiBRY4EAojPKnTN4wGG2Y4QS7kqhFlbREXL8lXzNyhYdH8dUx/N5CooFUv
         5f9FhsEpyAffE6ix46XNFHsNLpbDy44u9q0+/nzQa8zGDryJGreZYpkecUAIhLCTNsKX
         8RBHhteScR/yzBLD9STZxZ9SGWQhM4DjKw5yOtRfwwBPrOSV+QCsJOBQ8sem/5rkTrsw
         LxzLo7bx/syTlS2VzwwldcKRi/mTm1SghWbrk8McIuwm4pdf2ENoF+YXDE8Wy8IYJHxe
         qVVg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Jq6BjIt2;
       spf=pass (google.com: domain of peterx@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=peterx@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <peterx@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 9-20020ac85949000000b00423d65135f7si3377128qtz.809.2024.01.10.00.44.17
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jan 2024 00:44:17 -0800 (PST)
Received-SPF: pass (google.com: domain of peterx@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Jq6BjIt2;
       spf=pass (google.com: domain of peterx@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=peterx@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704876256;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=609N03LdjpkxAYKf0CfIMFNH4ZnJqwVCDxCBxZ9EZlM=;
	b=Jq6BjIt2zPDO9yz+zmKxPCn9wjS66Eopnhmqe/tf6yYJgWWsJK/yatd8+XzqqOhbmxttI9
	F0bGyQMB7A/PhjdqcF/7iE+WHJHoD2MltNxAoDZLw4yZpdKd+GIl05V4dEAkm+UFpPsqk4
	twkFmADBCbYlw3BLmCyIFbw3E+zBOsg=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-164-KkbvRvBgNmOk5liB-2NaVw-1; Wed, 10 Jan 2024 03:44:15 -0500
X-MC-Unique: KkbvRvBgNmOk5liB-2NaVw-1
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-1d44a50ab19so8308895ad.1
        for <alex.bennee@linaro.org>; Wed, 10 Jan 2024 00:44:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704876255; x=1705481055;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=609N03LdjpkxAYKf0CfIMFNH4ZnJqwVCDxCBxZ9EZlM=;
        b=tmlztzvTad2st5Wh6a/ORTf540uukae+GW+oIcQBWDLCuc0aukde7BIIG055rNfn48
         XwhSogYYJ0jAHdGbGse7BNKfw5Z8YUFf6rLqoLPQaW3VVVcvoxrKrAlcsCuScZtcF3Bt
         aXz/4X8BUY25icJhwl4EpaFGLurBmFJNWNmggrHfDDTZ7YMMmj41o3fc/mfWTmgI5cdk
         t6vl74OtXqyNjQ7z6vmuPexCzxNrd/ZrGgEdFG37C/CC2QJ9JTtkqUtBzcqfiX2clzel
         ZlerP1yjmQZMWDCnHO8CULm1ZU0KkxR3KO1asEJktHABsfeBLGE3CBoTrJIWq1Igzokw
         LEiA==
X-Gm-Message-State: AOJu0Yyqhvutl9sADV+Zv3mCB+2tbziL3aruElocj3ZvUkVm8EfRcG0Q
	VvC6ghHT7zyiEyl47HI57IxUNvC0FyfHiOPccQG2O1cBFiHKKmrcuw/LK8xALaW0wEbdEC1RGZY
	ujfAx1nfFFZMHM70RTiSqo7ey
X-Received: by 2002:a17:902:7297:b0:1d5:4c03:9988 with SMTP id d23-20020a170902729700b001d54c039988mr1289576pll.2.1704876254836;
        Wed, 10 Jan 2024 00:44:14 -0800 (PST)
X-Received: by 2002:a17:902:7297:b0:1d5:4c03:9988 with SMTP id d23-20020a170902729700b001d54c039988mr1289560pll.2.1704876254547;
        Wed, 10 Jan 2024 00:44:14 -0800 (PST)
Return-Path: <peterx@redhat.com>
Received: from x1n ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id t24-20020a1709028c9800b001ce5b859a59sm3089659plo.305.2024.01.10.00.44.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jan 2024 00:44:14 -0800 (PST)
Date: Wed, 10 Jan 2024 16:44:01 +0800
From: Peter Xu <peterx@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Fabiano Rosas <farosas@suse.de>,
	=?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
	qemu-devel@nongnu.org,
	Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Tyrone Ting <kfting@nuvoton.com>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Joel Stanley <joel@jms.id.au>,
	Alistair Francis <alistair@alistair23.me>,
	Anton Johansson <anjo@rev.ng>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Hao Wu <wuhaotsh@google.com>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Rob Herring <robh@kernel.org>, qemu-arm@nongnu.org,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: [PATCH 00/33] hw/cpu/arm: Remove one use of qemu_get_cpu() in
 A7/A15 MPCore priv
Message-ID: <ZZ5Y0UMA2h2x_tb9@x1n>
References: <87y1d6i47m.fsf@suse.de>
 <597186d9-af21-46e8-8075-f21d36c01c07@kaod.org>
 <87plya76cu.fsf@suse.de>
 <d5c0b9fb-8b09-4f68-b3ab-c8adffd484a9@kaod.org>
 <87bk9u8dhs.fsf@suse.de>
 <2fa344b7-ccd2-4e6a-8c32-5ad7e4c960d6@linaro.org>
 <ZZ4Qrfis4XHWGN0j@x1n>
 <87cyu9hgit.fsf@pond.sub.org>
 <ZZ44iQRPrdDpfov7@x1n>
 <87sf35ehio.fsf@pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87sf35ehio.fsf@pond.sub.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-TUID: tY6ilx9eD92h

On Wed, Jan 10, 2024 at 09:09:51AM +0100, Markus Armbruster wrote:
> If an object has state that needs to be migrated only sometimes, and
> that part of the state is large enough to bother, we can put it in an
> optional subsection, can't we?
> 
> Destination: if present, take it.  If absent, initialize to default.
> 
> Source: send unless (known to be) in default state.

Hmm.. correct. I think I messed up VMSD's needed() hook with field_exists()
of the fields; my apologies.

The trick should be that VMSD's subsections is more flexible, due to the
fact that vmstate_subsection_load() has:

    while (qemu_peek_byte(f, 0) == QEMU_VM_SUBSECTION) {
        ...
        sub_vmsd = vmstate_get_subsection(vmsd->subsections, idstr);
        ...
    }

So it tolerates the case where the subsection doesn't exist, or out of
order subsections.

While field_exists() hook seems not that flexible, as it's implemented as
this in vmstate_load_state():

    while (field->name) {
        ...
        if (vmstate_field_exists(vmsd, field, opaque, version_id)) {
           ...
        }
        ...
        field++;
    }

So that vmstate_field_exists() needs to be known even on dest before the
main vmsd got loaded, and it should always return the same value as the
source.  Also, the field has ordering requirements.

Then yes, subsection should work for dynamic objects.

Thanks,

-- 
Peter Xu
