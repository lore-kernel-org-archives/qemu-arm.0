Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp4491448njd;
        Fri, 25 Apr 2025 09:28:45 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWkeeTtGnmiSEPvA7W/UnW18zt0To/kGOwoy491cLMzUKyu2DDvji+FEV1S5Dw0RV/iUcMtuoTv8pZClQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGkexRjSabCLSSxW4Fh0RGA24SxASVMRfOzNsBZ59eZqD9IwHpQXqWizHkF65QGozi+CFKI
X-Received: by 2002:a05:6102:15aa:b0:4c3:6393:843f with SMTP id ada2fe7eead31-4d5432e896fmr2161792137.5.1745598525020;
        Fri, 25 Apr 2025 09:28:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745598525; cv=none;
        d=google.com; s=arc-20240605;
        b=ZMdq4PO9ubsggifTCpejj4kG53mrR3/Jd8pNUedEUtR6OKP9QuPMmypxmeXseAnNJ1
         vBR5C0khgYY2unsR9LCSCcrkDpqIAHDSokVk9cFDcARQ2vLG5jP/vyYg7/Kfo3SSjRMd
         tf375yHM0DmPb47K1BrN8aU1fpwDCR2IkhKMDr7Sd5vJ+aTMFH/Hzposi6DEFKE8D8dI
         y7CEiWs1YiyX5A+2o6D2bgWa3VTHOcgC+oQlnw5uEC1dVTsB7OFrGYcezjMwPM7TjSKQ
         hmG5txQLY1OChxRYVWuq3x0mKJVGLtZYEV27MX4vMuPvtvWsu8ygIasKxz/WzWtEtg0T
         1gng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:cc:to:from:date:dkim-signature;
        bh=8IW6pFami44fkpD05T5xDvdOPGvuvVMbS/1lYecfLLk=;
        fh=SVITByd096CxnvCwR2+3rnTZJdJLB5JR0qAQd3zDSOg=;
        b=QwPM1N6r98Mf0J6G67M2RS503i2hN1keLNGtizQzK2ObsJwl4zYWlXGvGnVBXmfsde
         cv0CIJYkO6QCfazuWg5TTtfK8ZMGOcGt+QzccjxRuMD3T+okKMTp80dmpqBC0UPiJ/Kg
         dO31SUwBPsQUxNIGwfFc1LUEGYLibd8yM5kmIXVSZCjXqkuXSAdqyxf6v6zwq+l0/K94
         eBgZcHqrkekvO8Vmkfq8grCSA4fHhXXC7KdqCvcNb0nPCaGahw8HQqfvMF+jHabtVGnR
         KB4OkHQYtx4iVIW1g8WrTdZKi1wpDAM75u1OCmGW6o9YSbV+OZsCBdtjeakngxEvoCtO
         yY3g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b="I/22blLR";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4d3d77b6c92si1085284137.491.2025.04.25.09.28.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 25 Apr 2025 09:28:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b="I/22blLR";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1u8Lu7-0002ho-JO; Fri, 25 Apr 2025 12:27:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1u8Lu4-0002fw-FK; Fri, 25 Apr 2025 12:27:53 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1u8Lu2-0003nA-QK; Fri, 25 Apr 2025 12:27:52 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-43cf034d4abso23381185e9.3; 
 Fri, 25 Apr 2025 09:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745598469; x=1746203269; darn=nongnu.org;
 h=user-agent:in-reply-to:content-transfer-encoding
 :content-disposition:mime-version:references:message-id:subject:cc
 :to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=8IW6pFami44fkpD05T5xDvdOPGvuvVMbS/1lYecfLLk=;
 b=I/22blLRHCzRZjV97Ia+B6mpbo5qQB/lWWV1FuZDLEO4kRWo5QWMeQiLXw1AZC5mes
 rDekUXzDin5eyngO1NmTkL3YeyCI0tEJbBfSJIhaJrNLDihlo/7O79Scrf5nmpplfx8L
 R7BAGyE7rksuzP4gHEUddrQiEVxtizVfati/6C5dX8MdJaOK42NRdP0UgUH3HNWTDqKr
 EwQOmhLMyGD6rFXZqOFh94q0d3NFLROMqsXJDPocqQntDdQQlJ9v8MHKEFPIWIOmxJXk
 h/oHKTj6QeyJNmK1tOq3dUK7XLSOliXI+l3mREi0fjYjfuMt//lhdWzwSYubPRTPSoBe
 2YsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745598469; x=1746203269;
 h=user-agent:in-reply-to:content-transfer-encoding
 :content-disposition:mime-version:references:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8IW6pFami44fkpD05T5xDvdOPGvuvVMbS/1lYecfLLk=;
 b=L9uVTpAh4F4Vls0p1VN3eOSaPIhqpIANxNFF+PHLDk/yNSBCJuFWCgZakL0Vrz50fA
 6mlH0+WYpd3pzgPSj5T5kVZlKjpaKeKsl5e2nQfOGpbRzsw4hUrikkN4+iGppO3JbacJ
 KWz3fhKQEkgYiXPg5x98wLWYJIDOVCmCX9EGk79vw89Uap6+ytXiiymVjswqS1wwemjy
 2IiXHm7DYl7KG6R6mhDe/VX9HdSkqYJUrbUdeVIvjMZ+U39RSPxmeFmUB9BODPSjWoTA
 gAtiIcrndfwyQoGRDtejp3cu+oq+d9e05B3ucygOhzafUUGDO9Sn5wZu1hO+Oe4C6/Ns
 t6Wg==
X-Forwarded-Encrypted: i=1;
 AJvYcCULquZb7h4q6xqpxD+e9Ay+10wMAjLKX2GYTJ51qahgduCQhIqjnHKScwTvqSgTA7zYR9NqA+eM/Q==@nongnu.org
X-Gm-Message-State: AOJu0YztWO+X/HRzZsDUuoN64662yYLYzC7QE9msWvfBUcVr0ad09X1V
 68ODRFZviQHhyazBIloQzRYPv8IwRNm7YSY/bHD7HHeVE7g8gLg/
X-Gm-Gg: ASbGncu4XQ5/rqDjMA3zEU8EpjpijgTbQ/R3PsI6/7VE7FuO4K8QZu5Vapz9vonAQxX
 fOJeyn3LdhPAh4y/MqVtdLlk8KY6LwvtA77A9Cf6YqkonoRtEfMg3eylUiLxBEiCy73wCtkvE6t
 QzAWwSzdcyoQfo94x/DIzt8+BzJnO+AmbWiAjddDN2XwetGdY/ULFxUHxE6BLXwt1Q6Qmd6s306
 W7nK98qGOO3HeffY0d7RfaFarWm5Royh9ttBeQfRSYEOmDwW2ES4vcbdeBCx65l5pvxAj0QRQo2
 UGp9rldhFVB9deY/CLJMqTXpWRKx71On4GJTFLWyuRpMQLj6raYJ2ye0L6lT2WIVq5LR/aAsFJE
 /3bZlc3HzW8+N
X-Received: by 2002:a05:600c:354a:b0:439:9b2a:1b2f with SMTP id
 5b1f17b1804b1-440a64c14afmr23435665e9.3.1745598468617; 
 Fri, 25 Apr 2025 09:27:48 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4409d29ba29sm63935765e9.7.2025.04.25.09.27.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Apr 2025 09:27:48 -0700 (PDT)
Date: Fri, 25 Apr 2025 18:27:47 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Corvin =?iso-8859-1?Q?K=F6hne?= <corvin.koehne@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Yannick =?iso-8859-1?Q?Vo=DFen?= <y.vossen@beckhoff.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 Corvin =?iso-8859-1?Q?K=F6hne?= <c.koehne@beckhoff.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 08/21] hw/dma/zynq-devcfg: Fix register memory
Message-ID: <aAu4A8pWqS0QTFHR@zapote>
References: <20250318130817.119636-1-corvin.koehne@gmail.com>
 <20250318130817.119636-9-corvin.koehne@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250318130817.119636-9-corvin.koehne@gmail.com>
User-Agent: Mutt/2.2.12 (2023-09-09)
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: kSALGqOtVLO3

On Tue, Mar 18, 2025 at 02:07:59PM +0100, Corvin Kˆhne wrote:
> From: YannickV <Y.Vossen@beckhoff.com>
> 
> Registers are always 32 bit aligned. R_MAX is not the maximum
> register address, it is the maximum register number. The memory
> size can be determined by 4 * R_MAX.
> 
> Currently every register with an offset bigger than 0x40 will be
> ignored, because the memory size is set wrong. This effects the
> MCTRL register and makes it useless. This commit restores the
> correct behaviour.
> 
> Signed-off-by: Yannick Voﬂen <y.vossen@beckhoff.com>

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>


> ---
>  hw/dma/xlnx-zynq-devcfg.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/dma/xlnx-zynq-devcfg.c b/hw/dma/xlnx-zynq-devcfg.c
> index c595d090fa..24461677ef 100644
> --- a/hw/dma/xlnx-zynq-devcfg.c
> +++ b/hw/dma/xlnx-zynq-devcfg.c
> @@ -400,7 +400,7 @@ static void xlnx_zynq_devcfg_init(Object *obj)
>                                s->regs_info, s->regs,
>                                &xlnx_zynq_devcfg_reg_ops,
>                                XLNX_ZYNQ_DEVCFG_ERR_DEBUG,
> -                              XLNX_ZYNQ_DEVCFG_R_MAX);
> +                              XLNX_ZYNQ_DEVCFG_R_MAX * 4);
>      memory_region_add_subregion(&s->iomem,
>                                  A_CTRL,
>                                  &reg_array->mem);
> -- 
> 2.49.0
> 
