Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp5482702ejc;
        Mon, 27 Feb 2023 23:43:52 -0800 (PST)
X-Google-Smtp-Source: AK7set8gB000b/XOpUb4lUbDwSnbKTCrvaEyB6eCQaWHR2jx50D1fiATPwp7KEkmw2BAAteCc50Y
X-Received: by 2002:ac8:5a43:0:b0:3bd:f03:5f12 with SMTP id o3-20020ac85a43000000b003bd0f035f12mr3437449qta.42.1677570232564;
        Mon, 27 Feb 2023 23:43:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677570232; cv=none;
        d=google.com; s=arc-20160816;
        b=Pj9UZ22w6cmCKCvEIm3/qywNtMxgbf0CvpCAWap2NR21eYJWsEqLJrJ1CF3hgyBJpB
         XqxBTNtYfBp1WZfkwxPzLM9Dyy0LxKpQKoYyA1B7oRiRGKsj/2E8vkanGKoROLUge0ks
         gDGUtGjW1ridKGBVLgLsw4yM70ba/Al8kouQmlZtzdLGmGAu4P2VfP5JUDdLgRPIfVLp
         L2MAYggnlsNwIBXBuk1CSjY1+X1KYQw3xWRXQZ8lt7QcCoeH3ROXwC6lx9Ph+In5Wdln
         vas2G8vcMOc9h2CO9676lnYaz3lbXV27FCDSUn76dPnZGkCS0dUclGTUiVQLTpPdVmyf
         KVQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=ufREbMFBsFQIjAxMK7Naz6Z2bm0FVGjZtzY/hZNym1g=;
        b=rIggQverNI1Bi+kHH996sueqEAbYXOuzWn+Ux163cEyxkf3h+wHgLM6AlWnCZhCT52
         fK6WEmh/h54SFbypKTRQPdI3e8hRsn37m7vxirehmapn1PnTclnbhp/37Gb5ifKC2bJK
         RXV1eAsHmXvcOjmQ+I1ztnxR8JlTIYr3G7/hODJFcXBRhhg/CneAjSmMnBMm4MyRADJY
         s5KDe4TtbPU+0Ww+AdzgpzB7KVlQ7S8UltNzj1zT2Focv42/JLo3VFe2Iq52W9FLhThw
         hANIeABCPE6A6u3WqH0toLk+juzbUyFbCjLGTzLHBFl9Z4S7e1nUN4D8Bw5SwRb5pWMD
         Bx2A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XUg3EiS1;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id y14-20020a05622a004e00b003bccff19a53si8781838qtw.686.2023.02.27.23.43.52
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Feb 2023 23:43:52 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XUg3EiS1;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677570232;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ufREbMFBsFQIjAxMK7Naz6Z2bm0FVGjZtzY/hZNym1g=;
	b=XUg3EiS1IwZ3xENMQy5pKOzWLXlgeErGMeMAurBuxXYTcWvhNNUMFOoLmhoPBlk9bW7b6m
	JmrBi0LN960FPOk5P2EYgFMz6nGvF8XXJnA8G3UHHcZNGB6NDTCaym4z6X6KKqQ6D833jv
	5PT9Q7cHl3hPJuCaZpbKIUXLjM1SBVo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-649-pFU_2jdYNpWDi-DpKcyadg-1; Tue, 28 Feb 2023 02:43:51 -0500
X-MC-Unique: pFU_2jdYNpWDi-DpKcyadg-1
Received: by mail-wr1-f71.google.com with SMTP id l5-20020a5d6745000000b002c91cb49949so1259080wrw.14
        for <alex.bennee@linaro.org>; Mon, 27 Feb 2023 23:43:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ufREbMFBsFQIjAxMK7Naz6Z2bm0FVGjZtzY/hZNym1g=;
        b=jtrI4tyUcMJWW+mdz18N31cX6vHkD4mDCBgkXNPNFsiz3srqIFGmgRqJFN8SSW+NxC
         2aXmYH5ZB2RR+LhXtKrT9DMyOnaDQV+6r1Eq0AL993OZ8JKxXAwnxSHXjfIuaUqBenfA
         3BFqCShTMyKC9/4JgAFC1v2/Z1C3cFymDM3ss0bCgFbFb1tijNfGPbGpCRZyUN2esWut
         +Hs9BdIZW7GxJ0+ds3qQjKlgxNeyrbgrjowxld1ftYlbVzKb23wXnMM5a3RgxaXMR5Pr
         IOjaEvsbdIarxQ2RH2V28I4mCo4B6hg3RnBMTJFwnHfeFlIjvPyNDhTyuaeoSzatLU/e
         AMGA==
X-Gm-Message-State: AO0yUKUK1oILjge6uVqsxED6rzQsW1/nv9uR2qNGgCODBJPS98Y3a5hT
	HZb1j+yCc2+vAoeyir5hnzj9GJRIS1hQA3cR5zrG5hePQOkPf+nzO0/91PfC47pRt6juNOjqSyH
	JLB+96qd/rsnlkM1U
X-Received: by 2002:a5d:424a:0:b0:2ca:d5dc:bba4 with SMTP id s10-20020a5d424a000000b002cad5dcbba4mr1466420wrr.59.1677570229808;
        Mon, 27 Feb 2023 23:43:49 -0800 (PST)
X-Received: by 2002:a5d:424a:0:b0:2ca:d5dc:bba4 with SMTP id s10-20020a5d424a000000b002cad5dcbba4mr1466399wrr.59.1677570229519;
        Mon, 27 Feb 2023 23:43:49 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.2] (ip-109-43-177-75.web.vodafone.de. [109.43.177.75])
        by smtp.gmail.com with ESMTPSA id u17-20020adff891000000b002c553e061fdsm8954445wrp.112.2023.02.27.23.43.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Feb 2023 23:43:48 -0800 (PST)
Message-ID: <2979548a-59f9-744f-70a7-d0fd00be0a2a@redhat.com>
Date: Tue, 28 Feb 2023 08:43:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 1/2] docs/about: Deprecate 32-bit x86 hosts and
 qemu-system-i386
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Maxim Levitsky <mlevitsk@redhat.com>, libvir-list@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, Reinoud Zandijk <reinoud@netbsd.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20230227111050.54083-1-thuth@redhat.com>
 <20230227111050.54083-2-thuth@redhat.com> <Y/yY72L9wyjuv3Yz@redhat.com>
 <20230227150858-mutt-send-email-mst@kernel.org>
 <77b8545c-4f2a-b389-2811-47d2d48940d9@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <77b8545c-4f2a-b389-2811-47d2d48940d9@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: zuyZoyF1cILh

On 27/02/2023 23.32, Philippe Mathieu-Daudé wrote:
> On 27/2/23 21:12, Michael S. Tsirkin wrote:
>> On Mon, Feb 27, 2023 at 11:50:07AM +0000, Daniel P. Berrangé wrote:
>>> I feel like we should have separate deprecation entries for the
>>> i686 host support, and for qemu-system-i386 emulator binary, as
>>> although they're related they are independant features with
>>> differing impact. eg removing qemu-system-i386 affects all
>>> host architectures, not merely 32-bit x86 host, so I think we
>>> can explain the impact more clearly if we separate them.
>>
>> Removing qemu-system-i386 seems ok to me - I think qemu-system-x86_64 is
>> a superset.
> 
> Doesn't qemu-system-i386 start the CPU in a different mode that
> qemu-system-x86_64? Last time we discussed it, we mention adding
> -32 and -64 CLI flags to maintain compat, and IIRC this flag would
> add boot code to switch the CPU in 32-b. But then maybe I misunderstood.
> Thomas said, "CPUs must start in the same mode they start in HW".

No, I think you misunderstood something here. x86 CPUs always start in 
16-bit mode, as far as I know, and the firmware / OS then has to switch to 
32-bit or 64-bit mode as desired.

  Thomas
