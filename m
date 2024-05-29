Received: by 2002:a17:906:32d0:b0:a63:3083:985b with SMTP id k16csp734920ejk;
        Wed, 29 May 2024 10:23:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEnqxgACoccY3IfKUJuIQi6wyU+E+1Wdrttf+iQlfk+G2x5pdo7SSR0bpPl5KaxXnqwXtBO
X-Received: by 2002:a67:f049:0:b0:48b:a725:8d74 with SMTP id ada2fe7eead31-48ba7258d9amr1776537137.0.1717003406537;
        Wed, 29 May 2024 10:23:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1717003406; cv=none;
        d=google.com; s=arc-20160816;
        b=CgOk9TmJxZTsUVg4PqeacccIZOzSGOBHzC00TRFyP5DuAHyJeO8xnM+wGmFYYEG/iL
         34c/s6Fp5Wbv/Hm+puDSD8Dnb2Wb6rZM1QGM15g9TezNEL8iQh/8nlGze8CUOy291VL/
         NM8D4yk2qbhUaV8FpDCAWS+LwmbKp4T6J5QEvKfIxRrmTo6Pyyx8oldBEdUhP/oGcrPB
         tBWbS1FC/Fe1Uzpv9sE96PYrzwnHLTVEZnEZckjT6/VTfhXBAG8+qEaesxzlGizU/0vw
         jPRokG12ku4aIa+kS/TrnFwtP34Y2u7BA2MMDPrkYNeWrfUsfv4d8V6rUGGg2TqpX1GI
         v0Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=HBjU4joLtZ34MoUVP0vLFjD8Sxz8XBWhYTUauOTxx88=;
        fh=6abeygNGXYzToZxsYxMaLypk9NlkImfHhAVaGIsLkKo=;
        b=dmLngAx8vxY+a2/U1NmTzhHSdKpUU/n97vu1CPWF+Y3yHdngvsoQhCS5IgyfJRTIH3
         Pi/4Z2jjdVOUkt6/a86e5zFq5jx4m+fxEK3cYA172b9iZlwHOJIgjyh82RamrmrbVKAv
         cbYaH1cMR+YU3Nuu0d/Nrrv9IddsHpv6OODRkxmm/6E99VYn+JQj3CpZ2Z3fYqLaWD8a
         iuXrvsvWZgKhUkqoJO0z4sMGkAFVukzD4q4OQ7nlA34GiBaUEBthcYMowq20bp9faKrs
         F6Nukv7Tujr7gQO5ESQf3ohGdnllq7BtAlfSkqCVKgbYTMF791q18dWmYWCzmYquE7wk
         0/Sw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="V4z99o/s";
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id ada2fe7eead31-48bac7dbe6bsi185435137.405.2024.05.29.10.23.26
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 10:23:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="V4z99o/s";
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717003406;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=HBjU4joLtZ34MoUVP0vLFjD8Sxz8XBWhYTUauOTxx88=;
	b=V4z99o/swDXiGWJ5C5xGNOJau9HzX93c4gwJoCw4/p64dA7et54b49CLth/zS9ddwpIinJ
	JWq/xE68bftrfJb44nPITO409YROWljLd/M2SdCZ0gGMNdcfdN3ZfXoknj1dnXTWev4N6y
	dIIPFmg+OOeyRFP41mT/cl1eHPll+Vw=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-695-lIgpi08DNLqAZEXr_XiOOQ-1; Wed, 29 May 2024 13:23:25 -0400
X-MC-Unique: lIgpi08DNLqAZEXr_XiOOQ-1
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-794a0a73d75so34706085a.0
        for <alex.bennee@linaro.org>; Wed, 29 May 2024 10:23:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717003404; x=1717608204;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HBjU4joLtZ34MoUVP0vLFjD8Sxz8XBWhYTUauOTxx88=;
        b=tSY+L0OBCuap/FSK7+WGFSb5/OWTXBctrtupXkGUPYssqyC9FTtbT/eyYDxcIwMjQ3
         hmAeU/NQFVsrLZJ0pWhxygFTTXtyNNS8/rucpX/NrqyrdDUoj16K5P4UShQEUZT6MZJr
         hAKqdwUSftuaOkmljgn4tnvEkETpV+ZgxIaejeP0BPl+EwNZ5wIF5oQPHz8tBJUFf7GU
         bJGuYfCcnnIkXJz2VQp2Q5UAvPh3ci5R9MFCAd3y7yonCUikfeNf3Oj8u9ZTHGKyn6pe
         n2RiEh913BR0ZYRJddzfriaAUh2URLWImkzlTn0x+hE0aFYA/ujddAP6UzQPXlBtMpnd
         Ykfg==
X-Gm-Message-State: AOJu0Yzlpi53mBBq+npGnEpH1zykicS/zKU/W58nj/hlp8loOQriWjID
	6BnKfPn9ZnXAemOCPgUOVb+O8vt25axOlQBmCaBFTigwyi6GmTSQe2VDMYk+9lbkXLlWiBfAhjR
	CRjEvF1+pI6Tu7HfFMJldGcHUsdgxk2hPIFHlwENEiw/bW3vAxch1mIYqbutQcnAFDIN1e8qcpZ
	wW2bs8oJTP2G9bdsqQCwqdt1yPXauwAreflQ==
X-Received: by 2002:a05:620a:1a29:b0:790:8656:8427 with SMTP id af79cd13be357-794dfb6bc9cmr474597985a.7.1717003404399;
        Wed, 29 May 2024 10:23:24 -0700 (PDT)
X-Received: by 2002:a05:620a:1a29:b0:790:8656:8427 with SMTP id af79cd13be357-794dfb6bc9cmr474591885a.7.1717003403837;
        Wed, 29 May 2024 10:23:23 -0700 (PDT)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.4] (ip-109-43-176-229.web.vodafone.de. [109.43.176.229])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-43fe5e25ee9sm4999961cf.33.2024.05.29.10.23.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 May 2024 10:23:23 -0700 (PDT)
Message-ID: <8a71fea1-9446-458a-a30e-4b98ab75c410@redhat.com>
Date: Wed, 29 May 2024 19:23:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/10] tests/lcitool: bump to latest version
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Cleber Rosa <crosa@redhat.com>
Cc: Laurent Vivier <lvivier@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Leif Lindholm <quic_llindhol@quicinc.com>, John Snow <jsnow@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Paolo Bonzini <pbonzini@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-s390x@nongnu.org,
 Radoslaw Biernacki <rad@semihalf.com>
References: <20240529160934.982373-1-alex.bennee@linaro.org>
 <20240529160934.982373-8-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20240529160934.982373-8-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: lTGWnl+pDzQ3

On 29/05/2024 18.09, Alex Bennée wrote:
> We have to simultaneously update a few bits on our side as lcitool has
> already deprecated fedora-38, alpine-3.18 and centos-8-stream. However
> there is no change to the package list yet.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

Have you tried a CI run with these changes? I don't think this will work 
yet. There are various issues with Fedora 40 that we need to solve first. 
Some of them are addressed with patches in my pull request from today, but 
others need more work first:

- Avocado v88 is broken on Fedora 40 due to the missing "imp" package.
   I've got a pull request for lci-tool pending, but it is not merged yet:
   https://gitlab.com/libvirt/libvirt-ci/-/merge_requests/489

- The "clang-system" jobs are failing due to the new -fsanitize=undefined
   errors that it discovers. Question is whether we want to fix all of them,
   or whether we disable the error detection instead.

- build-oss-fuzz job was failing, but that should get fixed with the
   patches from my PR from today (thanks to Alexander Bulekov for the
   patches)

So unless I missed something, you've got to postpone this patch a little bit.

  Thomas

