Received: by 2002:a17:505:1116:b0:1be9:327d:8ee3 with SMTP id pu22csp213004njb;
        Fri, 23 Aug 2024 07:45:01 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV5LvcxW+93XLICQ4/Xq00ZmiljRi00vtrflCs6pMOB8WaPS75ueD34MUP1AFQHbDqMdjOwHu4f/dJ5Ww==@linaro.org
X-Google-Smtp-Source: AGHT+IHDyh54vaRshb7mXKk7PiG+rYDul5ner+nT+XDSbENWErH5VLMy6YqQAKfrI7C05y6sJ0e2
X-Received: by 2002:a05:620a:269b:b0:79e:f851:66ec with SMTP id af79cd13be357-7a6897ba7cfmr243161985a.61.1724424301151;
        Fri, 23 Aug 2024 07:45:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1724424301; cv=none;
        d=google.com; s=arc-20160816;
        b=F+VTXRuY6v0/aQl5HoDDdaY4NAM7Kqmhu/07hjkJxrttSCDIDGEOnCnujPGgFIstye
         j8qd42lKcKCQDufmiNim8OnmNaEZQyuGK9l473GimS9461CyiTKW+fX1BKNweWqqXwzm
         B6I91SlmvkKu6Cw72r8BkZTs6id+wPkHIlRs0mqKIuhptLcdfmf3pJbYpDxtmrf4ujX0
         JjtSf1mXK2/Qh0qWx+RddgfKHUHUd1yKwBV7SiBV1YfQP7jWiqmjE2DQUKDPt/h/uXJO
         bC8Y4YDc5HrDSJefPq1P870QpIrTb75yNLFwmda9FegIgqx7VRunmEaDO+IewBUHICSQ
         wGEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:organization:content-language:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=fDO1UunCpORbilzq8v5rXeDb+AES/vyYNU4mVBCcBgo=;
        fh=y5E4WJwH5D+dW5XFeSZJJh3z6J9JAItWJPT9GOaipGM=;
        b=Hhk7SaRV6BKlRPleXGhEd5y8Nucbxw78dCf7u8ArwS71DaTPqHy8YyU+tjCVkRbpsu
         V4AcJ/lIMMKUIPT2Ynz5oqJLQpk5ozv6zmPAbJI/t+w8EM2j44kywsXwNLEjQ6DZQ7ls
         touJuEBdWvcDb79Dm83z0jEmo6mmdz8o0YzLVTqQHl64v3i8Gegq/L2pYg9/8OnjAhab
         HagIpOz5mX6qhVSxpRZsC6sdfwH4TxEsqIcwjvHOyulKlVOi46ATJq1G+XCvdB/54+6I
         mPo8eRjOTUjWqITGNxkNBRpdePkyZMbXzO+EEzO7LfNQVGz9K5hOfi3nmG0JFzpTPESU
         Av+w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IjO6Haj5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a67f40a62bsi433418985a.519.2024.08.23.07.45.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Aug 2024 07:45:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IjO6Haj5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1shVX4-0003Kf-Qe; Fri, 23 Aug 2024 10:44:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1shVX2-0003Is-NI
 for qemu-arm@nongnu.org; Fri, 23 Aug 2024 10:44:52 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1shVWz-0001A0-HX
 for qemu-arm@nongnu.org; Fri, 23 Aug 2024 10:44:52 -0400
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5bebd3b7c22so5080065a12.0
 for <qemu-arm@nongnu.org>; Fri, 23 Aug 2024 07:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724424286; x=1725029086; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:organization:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=fDO1UunCpORbilzq8v5rXeDb+AES/vyYNU4mVBCcBgo=;
 b=IjO6Haj5syMwAJJ9AWsFXAjipKbHXT1l6iDf4+Sl7c5S/WVhg74O7/9SA4IUhd/T41
 ovDV+6F0Qm79Ma5/hzr955+jxhK3WQl06anNLdPOPGUpyJeh9i9J7zZoxrqK12q81a5K
 Hg4LvoeWafTetm8r9iazWsedWOhwaF3eG4FQnmGJ5H4iekVro3wvw9hHQgPPLBteVUQ/
 xY2PKhgPJlHuCEM4HIEqPE/+fBrTWxd7dwhG9GvnzcmrjZeEUiKxl0CATLEbHDpf9vqX
 1JpRyD0fu8Cu9ug0S6QvgevXbSeSLTrmy3lysiHWk6W1KaN4YiP37FDiDNHResu0Ur5g
 3V6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724424286; x=1725029086;
 h=content-transfer-encoding:in-reply-to:organization:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fDO1UunCpORbilzq8v5rXeDb+AES/vyYNU4mVBCcBgo=;
 b=SDR80e/813GEu5A328ZFgd6pIHf+KVB9QQPR6KwRJ5MpqwaLBjNFj/3xYQydC6OhMt
 Trz6dsZU75Jm/0gu3vxKmhChneJ3zi+AKjgwLpm3gAqIPl9DW7LJqnddMdT5URZt7YAZ
 ROADF5S5isHyHtRTrV6sFtxkWqfn2Vdxzb0F9sUrqnIYt0EZGppvd/dYNzteWsb5th3Q
 2i7DSTr02qwl3wjxvkCCCHVYupSOMVtZPEh2Krys58hMurniw5zM/Clb8Qhk1D1wcAV9
 5YUJmzMJFlg4YrZbC9WHRxpnGxeQBkkMGRWx6AurXmgAx+4+szrGJW3Mh5m/fp62dk7V
 3j+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4OgcJlvciq1wRU3cpAHhd5AjSxAf+Koh0IDjMydTgSY2ADvv4OJYGA2jNgVZSF8sofU7X9Q1nsA==@nongnu.org
X-Gm-Message-State: AOJu0YyUpyIL5f60qtZbRIuwPHbg6VLEs1vXX4jPfkDpy9wP7WgQTpa7
 GDAfHYxcECXLwdjFzlhkq1210YFPJqmQoEi0liRgsrlO3SFcgc0ZD1XV7SsJEkyaWIAO+lTeg4b
 UY4g=
X-Received: by 2002:a17:906:6a1e:b0:a73:9037:fdf5 with SMTP id
 a640c23a62f3a-a86a2f1f72emr288622866b.6.1724424285862; 
 Fri, 23 Aug 2024 07:44:45 -0700 (PDT)
Received: from [192.168.200.25] (83.25.211.12.ipv4.supernova.orange.pl.
 [83.25.211.12]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a868f2adc55sm265928266b.71.2024.08.23.07.44.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Aug 2024 07:44:45 -0700 (PDT)
Message-ID: <857d39f8-c45c-489a-875e-7e1a4358aaf9@linaro.org>
Date: Fri, 23 Aug 2024 16:44:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] tests/functional: Convert Aarch64 SBSA-Ref avocado
 tests
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Leif Lindholm <quic_llindhol@quicinc.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Radoslaw Biernacki <rad@semihalf.com>, Thomas Huth <thuth@redhat.com>
References: <20240823131614.10269-1-philmd@linaro.org>
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Content-Language: pl-PL, en-GB
Organization: Linaro
In-Reply-To: <20240823131614.10269-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: sHrdbLiGRJPJ

On 23.08.2024 15:16, Philippe Mathieu-Daudé wrote:
> Straight forward conversion. Since SBSA_FLASH files are not
> tarballs, use lzma_uncompress() method.
> 
> Avocado used to set a timeout of 11 tests * 180s = 1980s.
> Hopefully 600s should be sufficient.
> 
> Running on macOS Sonoma / Apple silicon M1:
> 
>    $ QEMU_TEST_TIMEOUT_EXPECTED=1 make check-functional-aarch64 V=1
>    ▶ 1/5 test_aarch64_sbsaref.Aarch64SbsarefMachine.test_sbsaref_alpine_linux_max              OK
>    ▶ 1/5 test_aarch64_sbsaref.Aarch64SbsarefMachine.test_sbsaref_alpine_linux_max_pauth_impdef OK
>    ▶ 1/5 test_aarch64_sbsaref.Aarch64SbsarefMachine.test_sbsaref_alpine_linux_max_pauth_off    OK
>    ▶ 1/5 test_aarch64_sbsaref.Aarch64SbsarefMachine.test_sbsaref_alpine_linux_neoverse_n1      OK
>    ▶ 1/5 test_aarch64_sbsaref.Aarch64SbsarefMachine.test_sbsaref_edk2_firmware                 OK
>    ▶ 1/5 test_aarch64_sbsaref.Aarch64SbsarefMachine.test_sbsaref_openbsd73_cortex_a57          OK
>    ▶ 1/5 test_aarch64_sbsaref.Aarch64SbsarefMachine.test_sbsaref_openbsd73_max                 OK
>    ▶ 1/5 test_aarch64_sbsaref.Aarch64SbsarefMachine.test_sbsaref_openbsd73_max_pauth_impdef    OK
>    ▶ 1/5 test_aarch64_sbsaref.Aarch64SbsarefMachine.test_sbsaref_openbsd73_max_pauth_off       OK
>    ▶ 1/5 test_aarch64_sbsaref.Aarch64SbsarefMachine.test_sbsaref_openbsd73_neoverse_n1         OK
>    1/5 qemu:func-thorough+func-aarch64-thorough+thorough / func-aarch64-aarch64_sbsaref        OK   241.79s  11 subtests passed

354.35s   11 subtests passed

M1 Pro, Fedora Linux. 600s feels fine.

>    ...
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
> Based-on:<20240821082748.65853-1-thuth@redhat.com>

Reviewed-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
