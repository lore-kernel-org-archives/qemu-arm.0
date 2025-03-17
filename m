Received: by 2002:a17:504:5906:b0:1be9:327d:8ee3 with SMTP id nn6csp2048801njb;
        Sun, 16 Mar 2025 23:50:29 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUJDHQHS9tLVAvFm/roZbGqxREDY44fr3BuPEPgKMl6rL1vnyD+tFLssjGRcBpRUxUcBoBjozyQ488n8Q==@linaro.org
X-Google-Smtp-Source: AGHT+IGQlljtt+GEZOXNtIN+kMA4JHvTgx+pjUngq4QAh9HoHbu9qVlkbbZrIDY64ZAwXwoHmVoL
X-Received: by 2002:a05:622a:1113:b0:472:801:3e74 with SMTP id d75a77b69052e-476c81c8addmr163583541cf.41.1742194229033;
        Sun, 16 Mar 2025 23:50:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742194229; cv=none;
        d=google.com; s=arc-20240605;
        b=P31g1S9Y9lgR6HLLNTQxrUYYztjxjzljoh/blt28YTtBEG/sLBGxpaQQj95zQVJFqw
         GGOBzzaziwnFwltIQC6w7IjHTV4OSYOTBxlv53RhYzHDNSvzI0UbRi1XaTyh7mlWWF6C
         /vX7F8PW9N0X57VavvixWsuehpYP78+8L3zBdXrFT8CsHrdUJ8o1MCv3hZYD4Q3UVZbt
         meyvXYw/j1khZMWO6rswWzLL67yORDLA316iYL3qnUuzXWvrstTmPsD1DkQ41Pl2cvAq
         dD61pZEU05mCC8GSQf7ZdBBsRel0Is/thZL9Mciwc6KvCUS22nAQ+X60eOJs2AycLfD9
         FOnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=kdnn8FkUZO4a6qwLoBeEecTRo9TL7EwfSuxKTPZVTLg=;
        fh=9YQsQVqQhOivQtVKFvSUmaYFherVSdMSkbB06o6JqQM=;
        b=DLm5myARSNoK1eJ2cmXlQZ2RApYFOFkPTGq1sOtJ/xl9Cd9N4jvKWCjuOzJKsHvw4+
         UKkpTRTjWslyrTWJGbLS1vKMX00OYKsHdPSA7g/VTxvf79FXtBCU5Z4uSUD3HpYXkX/6
         EdpYQSXEN+jFEroQwYpxaGeCwiKBCF+FGkuiJlQy+qPpLt0kBInjzaeb9hULodEfRn4o
         g6j3B2br2Js75aQDyVxwyRXnUbs86Ftro6RC6kW7WHJF3s52b7QVrCcVxku+BOcu0MTp
         rnAXLnwf+smPKwFMOulztVKRdxpvpjVPFWKRDPLeMoKqUclH/nYe246DseFcmLJd9bTy
         0KiQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FBN7IQtf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-476bb819e5esi96365091cf.365.2025.03.16.23.50.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 16 Mar 2025 23:50:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FBN7IQtf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tu4Im-0005x4-8S; Mon, 17 Mar 2025 02:50:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tu4Id-0005o0-Ju
 for qemu-arm@nongnu.org; Mon, 17 Mar 2025 02:50:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tu4IZ-0000lt-CU
 for qemu-arm@nongnu.org; Mon, 17 Mar 2025 02:50:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742194204;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=kdnn8FkUZO4a6qwLoBeEecTRo9TL7EwfSuxKTPZVTLg=;
 b=FBN7IQtfabkLAlscNYGFFI1qvJhxvT0jB4Cfn3dDfZrHn2aBE6LuntyhnhcDuNHirvKP+m
 R+ZV7I7Ci0tOY8UEITZVs1wk0/pXE66yxe7E9QoJ+v7U5oA6YHC5srNQytiAGcVlkc9X8D
 kiDcHY6QNGSIDLhmVl0+irw3b9brIkk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-512-O5wFXPj2NOGoSbwr5_GbBg-1; Mon, 17 Mar 2025 02:50:03 -0400
X-MC-Unique: O5wFXPj2NOGoSbwr5_GbBg-1
X-Mimecast-MFC-AGG-ID: O5wFXPj2NOGoSbwr5_GbBg_1742194202
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3914608e90eso2661700f8f.2
 for <qemu-arm@nongnu.org>; Sun, 16 Mar 2025 23:50:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742194202; x=1742799002;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kdnn8FkUZO4a6qwLoBeEecTRo9TL7EwfSuxKTPZVTLg=;
 b=ZWCCQhaBEpkfnX3SKfWtUvJrRD+COCp4L2wmQ+SOgD2RJFiHeDBqCUcfSA1O8gvlVw
 rwbUrb2cdvaRm3hMcuE+jpi8kwivBGty7jJ+iQDutLxv9OU25aw4K5tNrgbzlLLdt4Z5
 saYosO0/Q318VI51HMN4d0oKQtEzzUnZoysuj2FUyn0U9xwXrK1nOQqtDRv4dBYWi7vR
 EK3zfJ7Ev/2wmfi7E/qV1Dy+IZ+13LcvJTzJ36VqZ2Rd8yCsARkgVIBs3EM5dx0ULWm3
 ajH9Eg1COmRkufDV24e4gXyVoS74hUYL+3+0kPJHeVCdywT3j7iMcw2k7mHvDevj5u4F
 HOKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXUkzz44XUwQEqkrZZuuUlKkL4WHwaNiBWSGpiCbH8iSLs//wsI/orMS2lquYaYbUIIgP/kw3xlnA==@nongnu.org
X-Gm-Message-State: AOJu0YwLE6rEtdnGRfTvZgo/oS5QMc6qkiKjBdYuT+lB/eOZQxT0MfCw
 n5M2oFB/EVf6WU6bP6ymksTSCT2ehtd21l9owwNggkTvC0mVRJJXxNHLqVawT0vSz+8UNz9Z3+r
 /E5mYJCsDXq40U7aFFUsvnsnkpdoH5FWoAU5h51UkIyQ5WLECaNo4xgUBFQ==
X-Gm-Gg: ASbGncs1PJKCiTREZID20IiVcI7z8/HfGqUZjN9ANV7bch9qudUDFYKq8K9BJcFz7Rb
 12o2GfUdbF5cFU+B85g2ca4y7tA/B8gbaYlduUAkfPviSCmR91z8r4MqZ50doBi0qOgL6tprwbh
 +sI8Je/T7g/Xa8ZWa4ROg4iY9tqv7tvqKqEzyFB/UdRtahnL5FTFBgLhX/QR5Zx73ZITLtn2jfq
 zNrUX8kaXnf7p0I/M1XQlI/y5C43HAXCUQFxQZoKgmhlUjwLW2E8chkpEJgrL0yr6CXLgLzR7YN
 UAqNSoSab3RQDTYGYEb3KxWBrJXX/mcO9oW2g3kJO9nepUM=
X-Received: by 2002:a5d:648a:0:b0:391:2dea:c98d with SMTP id
 ffacd0b85a97d-3971dce07e1mr12207201f8f.8.1742194202090; 
 Sun, 16 Mar 2025 23:50:02 -0700 (PDT)
X-Received: by 2002:a5d:648a:0:b0:391:2dea:c98d with SMTP id
 ffacd0b85a97d-3971dce07e1mr12207183f8f.8.1742194201756; 
 Sun, 16 Mar 2025 23:50:01 -0700 (PDT)
Received: from [192.168.0.7] (ip-109-42-51-207.web.vodafone.de.
 [109.42.51.207]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395cb318a3dsm14084626f8f.74.2025.03.16.23.50.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 Mar 2025 23:50:01 -0700 (PDT)
Message-ID: <982cba8b-72e6-49d9-80bb-05053c00819c@redhat.com>
Date: Mon, 17 Mar 2025 07:49:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs/system: Fix the information on how to run certain
 functional tests
To: Niek Linnenbank <nieklinnenbank@gmail.com>
Cc: qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>,
 Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>, qemu-arm@nongnu.org
References: <20250311160847.388670-1-thuth@redhat.com>
 <CAPan3WqXwAWeAqbQypF7PCXh_pjDUgbbiWwXkPSbXrFetfMZAQ@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <CAPan3WqXwAWeAqbQypF7PCXh_pjDUgbbiWwXkPSbXrFetfMZAQ@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: BJxcummJeFcwUqcYy9A24DfAb9FzEnW5OG_VZIjnOcY_1742194202
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.333,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.01,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: kaRRdPamY07B

  Hi!

On 16/03/2025 21.21, Niek Linnenbank wrote:
> Hi Thomas,
> 
> On Tue, Mar 11, 2025 at 5:08 PM Thomas Huth <thuth@redhat.com 
> <mailto:thuth@redhat.com>> wrote:
> 
>     The tests have been converted to the functional framework, so
>     we should not talk about Avocado here anymore.
...
>     diff --git a/docs/system/arm/orangepi.rst b/docs/system/arm/orangepi.rst
>     index db87e81fec4..8b9448ca7b0 100644
>     --- a/docs/system/arm/orangepi.rst
>     +++ b/docs/system/arm/orangepi.rst
>     @@ -257,9 +257,9 @@ Orange Pi PC integration tests
> 
> Perhaps for consistency, we can also rename to 'functional tests' here.

Agreed, we don't use the term "integration tests" for this anymore.

> 
>       The Orange Pi PC machine has several integration tests included.
> 
> And same on this line.
> 
>       To run the whole set of tests, build QEMU from source and simply
>     -provide the following command:
>     +provide the following command from the build directory:
> 
>       .. code-block:: bash
> 
>     -  $ AVOCADO_ALLOW_LARGE_STORAGE=yes avocado --show=app,console run \
>     -     -t machine:orangepi-pc tests/avocado/boot_linux_console.py
>     +  $ QEMU_TEST_ALLOW_LARGE_STORAGE=1 \
>     +    meson test --suite thorough func-arm-arm_orangepi
> 
> I've tried to run on my Ubuntu 24.04.1 LTS based system using this exact 
> same command, but got this error:
> 
> $ QEMU_TEST_ALLOW_LARGE_STORAGE=1 meson test --suite thorough func-arm- 
> arm_orangepi
> 
> ERROR: Build data file '/home/user/qemu/build/meson-private/build.dat' 
> references functions or classes that don't exist. This probably means that 
> it was generated with an old version of meson. Consider reconfiguring the 
> directory with "meson setup --reconfigure".
> 
> The meson version I have installed via apt-get is 1.3.2-1ubuntu1. Only when 
> running using the 'meson' command from the pyvenv, it runs OK:
> 
> $ QEMU_TEST_ALLOW_LARGE_STORAGE=1 ./pyvenv/bin/meson test --suite thorough 
> func-arm-arm_orangepi

Oh, you're right! Thanks for catching it!

I guess I still had a "export PYTHONPATH=$HOME/qemu/python" in my 
environment, so I did not notice. Would you like to send a patch, or want me 
to do it?

  Thomas

