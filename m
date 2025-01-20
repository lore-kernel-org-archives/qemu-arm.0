Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp6009272njn;
        Mon, 20 Jan 2025 05:20:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGR48xZKemSFwwnj32Zr0dWQkT5QeXGfRKjpADvtEc9oItXJZykBsH6h7pzW04iOJoPVQPb
X-Received: by 2002:ac8:5907:0:b0:467:6617:2ed4 with SMTP id d75a77b69052e-46e12b6849emr185881051cf.40.1737379223596;
        Mon, 20 Jan 2025 05:20:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737379223; cv=none;
        d=google.com; s=arc-20240605;
        b=OMseUScxaHlfP9MqFWlngdE/jNospXRrrlRpbub/SvaR2Vd5E3zAqAbaKlPxjOrgu5
         AQDt99fffnZoDnlhhD7ssC0C0KyknfCGwpMaLNFWhZfdPHJWr+BL2uArNziZciD2IFPw
         aqt0LHiUbtm77LdoG9ox09ZMeLAjm4yMqH02V8qavMstJTT1L2Tw/DN/MDNOCHiTdgeA
         cFUJH2+ZB17M1K+z3/2HjZcuXuKpAzIU99m4CrZ5k3khxBI7sz05+MVRJKhKyIlkbBm/
         QQAfnOzYDlceEXByMfYyi3YIfIfD8X3W1pooaOWmE71mrnsslbjZlavpnJAHza1r5SD4
         bjEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=tUCSGOvXjkpk5BQqRBx9yHPCDlz9bGS7Yv8fUiKAe3c=;
        fh=al+b5TOPcuMHazWt7bAPzws6icowKOjCEnk42WCJLks=;
        b=CDWAQ5qlm0Lo8VqjNGWust8MFoi8RM6ECp+VvBSpeE26rc8BzUvjzihnAvphZS7eh/
         dFv49DSAlrxI0kwmCdKCeev8VDK7GMS6Wg+T4FypT9POU8k2fsyFMMb1knNO3cAiKO5W
         pje/7wqF054SBUcnYi0IeRY9DTCD9Nke3tx2LDi3aNCtIC94pi5MJ5nI35aunTnp/DHS
         qr803eA3Z2EanBiOYbVrT49GGsB8oMUs2Gf/LTfkUjphvBT+c+wajmKXUl1mC+m2PJHh
         4ykMQeVeAZT//2p8BPKcInsAzCAYljRUNAU9PMBiOGYxRq9/NeGycpFrvK4bZ/aZbKwU
         oFug==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hehlzG+T;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-46e10458ba6si101049511cf.431.2025.01.20.05.20.23
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 05:20:23 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hehlzG+T;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737379223;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=tUCSGOvXjkpk5BQqRBx9yHPCDlz9bGS7Yv8fUiKAe3c=;
	b=hehlzG+Tlw6wIOWRIXJanCyyw7DYgbkzfmqC5fC6CyW2ZYNkW0BfULcKI3IvRmFiA0JBi2
	0AmuDOwaZWIuuYtqv0a6KQPPkMSfWQVw7F1GYRJxWHN2Zmxdc73N0th1rVAYFFp0HSYx8/
	zKe4yGW5lXxrfOvSSblUYpaMge3cLqs=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-627-t6A_TgREMZSIJ8eH1mutcg-1; Mon, 20 Jan 2025 08:20:21 -0500
X-MC-Unique: t6A_TgREMZSIJ8eH1mutcg-1
X-Mimecast-MFC-AGG-ID: t6A_TgREMZSIJ8eH1mutcg
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-38634103b0dso2783792f8f.2
        for <alex.bennee@linaro.org>; Mon, 20 Jan 2025 05:20:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737379220; x=1737984020;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tUCSGOvXjkpk5BQqRBx9yHPCDlz9bGS7Yv8fUiKAe3c=;
        b=tycopSLH8QaiZQMg3qv2Du1xZpyYGbXVeXZVzgTVlpPKefqLnx8JWFjparKpZjdQVx
         fgHbei10Z+xYkYhe6f1NeQG6E/qV5NHIemmhxTyy+3DhG3B9YZp9jSx1JHlh088Kwm2z
         x6PKISSu5bcrnANNeM29uakx/2j0ZEaAWEutRkvXp//SwF3u29qnHzIWhinsbtjdMVE/
         ibnIvbc6Vy+dosqSRmw/+W0vZ+z0pCoTRYNj9+qadhA+FdR+kJ09OmO2uY/h0C/w/C7s
         XtxcDwDHnBRQMEdrBZGG0pZ4ru7xeuEIjL0P6Z4w2J+YdqXtwHUtlSFNevWZLmnCHFo2
         4Ofg==
X-Gm-Message-State: AOJu0Yz/LETmHffFLfg5l1yYe59iG8EGlhQnWBBo8RwXU65I+4bjamGO
	qL31xQ7Q9vzG85uw3wkiuD6QsVZ9kSSiIDxKtQ94l6PFflgD+Hmg2FE9jpTFNg0bZs7q/8DARkO
	EPPMgRdGcrZ0LKYs5FO89iiUUfjrt2mXATUvISsLHbxaTLIvGQ+xEVRjtZ2+5Bc0Q62GOo9RWyO
	LDoU1elmq6xGntkiz4QhPlYp+Jd/B9VYITcA==
X-Gm-Gg: ASbGncsE4e3pNa9oKyarDV8NNnfX4hoLjngu5jvnhgkA1/QtrHDCryKZIDGviLlb6SK
	ZE/KpTSZ8TxIStN39kCYHI5w9bQoT8ufmBfl9tAWG9H6cO3zH7ru5eEccM9Ac33iUsKp035SgMw
	mCPBNpgnLTwQC4ylgmFKDgCL3uU+UUarW1eteduWRJrGjOBMK0nyELROLjh9gGjNxgobEkyVchO
	+3BJoPrqmGxfLrt1QV318yjO/uX0qWWCA2QwpeCK2hk04oDF00PFAnpn+DCv1lXfKUtbExtg0X3
	ezEJOr7wO8/p3Iy6HqqylyJxJg==
X-Received: by 2002:a5d:5848:0:b0:385:e37a:2a56 with SMTP id ffacd0b85a97d-38bf57c0551mr11720757f8f.52.1737379219836;
        Mon, 20 Jan 2025 05:20:19 -0800 (PST)
X-Received: by 2002:a5d:5848:0:b0:385:e37a:2a56 with SMTP id ffacd0b85a97d-38bf57c0551mr11720660f8f.52.1737379218851;
        Mon, 20 Jan 2025 05:20:18 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.7] (ip-109-42-51-119.web.vodafone.de. [109.42.51.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf322a506sm10277639f8f.41.2025.01.20.05.20.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jan 2025 05:20:18 -0800 (PST)
Message-ID: <259ca4e4-5b24-41bf-b81f-fdd07b19ca3a@redhat.com>
Date: Mon, 20 Jan 2025 14:20:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 17/32] system/qtest: properly feedback results of
 clock_[step|set]
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>, qemu-arm <qemu-arm@nongnu.org>
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Fabiano Rosas <farosas@suse.de>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <lvivier@redhat.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Bernhard Beschow <shentey@gmail.com>,
 Bin Meng <bmeng.cn@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Joel Stanley <joel@jms.id.au>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, John Snow <jsnow@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Alistair Francis <alistair.francis@wdc.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org,
 Eric Farman <farman@linux.ibm.com>, Weiwei Li <liwei1518@gmail.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>
References: <20250108121054.1126164-1-alex.bennee@linaro.org>
 <20250108121054.1126164-18-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250108121054.1126164-18-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 6xcG331ClWcZ_9JkyjV2vjQyv5D1XeOpbiyCGG93lSM_1737379220
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: yS6rh4GUkpfU

On 08/01/2025 13.10, Alex Bennée wrote:
> Time will not advance if the system is paused or there are no timer
> events set for the future. In absence of pending timer events
> advancing time would make no difference the system state. Attempting
> to do so would be a bug and the test or device under test would need
> fixing.
> 
> Tighten up the result reporting to `FAIL` if time was not advanced.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Reviewed-by: Fabiano Rosas <farosas@suse.de>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2687
> ---
>   system/qtest.c | 23 ++++++++++++++---------
>   1 file changed, 14 insertions(+), 9 deletions(-)
> 
> diff --git a/system/qtest.c b/system/qtest.c
> index 99ef2042f6..e68ed0f2a8 100644
> --- a/system/qtest.c
> +++ b/system/qtest.c
> @@ -78,6 +78,11 @@ static void *qtest_server_send_opaque;
>    * let you adjust the value of the clock (monotonically).  All the commands
>    * return the current value of the clock in nanoseconds.
>    *
> + * If the commands FAIL then time wasn't advanced which is likely
> + * because the machine was in a paused state or no timer events exist
> + * in the future. This will cause qtest to abort and the test will
> + * need to check its assumptions.
> + *
>    * .. code-block:: none
>    *
>    *  > clock_step
> @@ -710,7 +715,8 @@ static void qtest_process_command(CharBackend *chr, gchar **words)
>               qtest_sendf(chr, "OK little\n");
>           }
>       } else if (qtest_enabled() && strcmp(words[0], "clock_step") == 0) {
> -        int64_t ns;
> +        int64_t old_ns = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> +        int64_t ns, new_ns;
>   
>           if (words[1]) {
>               int ret = qemu_strtoi64(words[1], NULL, 0, &ns);
> @@ -719,11 +725,10 @@ static void qtest_process_command(CharBackend *chr, gchar **words)
>               ns = qemu_clock_deadline_ns_all(QEMU_CLOCK_VIRTUAL,
>                                               QEMU_TIMER_ATTR_ALL);
>           }
> -        qemu_clock_advance_virtual_time(
> -            qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + ns);
> +        new_ns = qemu_clock_advance_virtual_time(old_ns + ns);
>           qtest_send_prefix(chr);
> -        qtest_sendf(chr, "OK %"PRIi64"\n",
> -                    (int64_t)qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL));
> +        qtest_sendf(chr, "%s %"PRIi64"\n",
> +                    new_ns > old_ns ? "OK" : "FAIL", new_ns);
>       } else if (strcmp(words[0], "module_load") == 0) {
>           Error *local_err = NULL;
>           int rv;
> @@ -740,16 +745,16 @@ static void qtest_process_command(CharBackend *chr, gchar **words)
>               qtest_sendf(chr, "FAIL\n");
>           }
>       } else if (qtest_enabled() && strcmp(words[0], "clock_set") == 0) {
> -        int64_t ns;
> +        int64_t ns, new_ns;
>           int ret;
>   
>           g_assert(words[1]);
>           ret = qemu_strtoi64(words[1], NULL, 0, &ns);
>           g_assert(ret == 0);
> -        qemu_clock_advance_virtual_time(ns);
> +        new_ns = qemu_clock_advance_virtual_time(ns);
>           qtest_send_prefix(chr);
> -        qtest_sendf(chr, "OK %"PRIi64"\n",
> -                    (int64_t)qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL));
> +        qtest_sendf(chr, "%s %"PRIi64"\n",
> +                    new_ns == ns ? "OK" : "FAIL", new_ns);
>       } else if (process_command_cb && process_command_cb(chr, words)) {
>           /* Command got consumed by the callback handler */
>       } else {

  Hi Alex,

this patch broke the check-cfi-ppc64-s390x and check-cfi-aarch64 tests in 
the gitlab CI:

  https://gitlab.com/thuth/qemu/-/jobs/8896718604#L78
  https://gitlab.com/thuth/qemu/-/jobs/8896718599#L72

Though it does not seem to be related to CFI, but rather to --disable-slirp, 
I can reproduce it locally like this:

  .../configure --target-list=ppc64-softmmu --disable-slirp --disable-docs
  make -j$(nproc)
  make tests/qtest/qos-test
  QTEST_QEMU_BINARY=./qemu-system-ppc64 tests/qtest/qos-test \
   -p 
/ppc64/pseries/spapr-pci-host-bridge/pci-bus-spapr/pci-bus/virtio-blk-pci/virtio-blk/virtio-blk-tests/config
  **
  ERROR:../qemu/tests/qtest/libqtest.c:719:qtest_rsp_args: assertion failed 
(words[0] == "OK"): ("FAIL" == "OK")
  not ok 
/ppc64/pseries/spapr-pci-host-bridge/pci-bus-spapr/pci-bus/virtio-blk-pci/virtio-blk/virtio-blk-tests/config 
- ERROR:../qemu/tests/qtest/libqtest.c:719:qtest_rsp_args: assertion failed 
(words[0] == "OK"): ("FAIL" == "OK")
  Bail out!
  Aborted (core dumped)

Bisecting the problem pointed me to your patch ... if you've got some spare 
time, could you please have a look?

  Thanks,
   Thomas
