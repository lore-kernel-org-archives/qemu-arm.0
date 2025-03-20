Received: by 2002:a17:505:ab84:b0:1be9:327d:8ee3 with SMTP id pj4csp744834njc;
        Wed, 19 Mar 2025 23:57:39 -0700 (PDT)
X-Received: by 2002:a05:600c:4690:b0:43c:fd72:f039 with SMTP id 5b1f17b1804b1-43d437a19efmr56768345e9.11.1742453859013;
        Wed, 19 Mar 2025 23:57:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742453858; cv=none;
        d=google.com; s=arc-20240605;
        b=Us+sVzhDkfaJ6RmxduuLhpk/qaF9MGCXj9FR3WizvTSqhrrewBjQRuA4D2XIwR3U7x
         LXDcmeeYJOBDWIxicUx+VUw2A0X6rAlO4jvFEjRZS7ZvL5SVlGhtHHC+UhF/G3B0QwK3
         7yhbJLTv1/Ls3WufU1IV1+wTOsK48RSQ2t8gtlEqi1ARrqshM+Hqk0pMaIBaMSm+3E1a
         VPIlRCwcuyvLdKJ8Kbx19hxdcP8Dz7cDHCTQ5RejtRQDV9BKXHa0HC4AHXIREiGVd76L
         Y5ByNLeUcdTPVy9sCKxeUUDhc2XGkJfHePIyR0y1I/NNYw3wG9BA8zDcm5YnakzGfxMg
         7ruw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=ZPhtlMEyE1t/TeBfGPHO/YBqHcTOXS9vsZ1BLG2PgpE=;
        fh=VTjyscoH3jg4EEBGXGBCijT0Cth03TkL5RpTsM1FyIc=;
        b=gK4DySXlULa4zuAY0y2CTFrxZXMgLEwdpsH9PjhRzt3WaShpI9Jr+TLWK1q4QKCFM+
         0R7QBIcULN+ckpCNF4UAY3VqSMxoXU+osKyQdRN0cnK+veh3lFXVi8jMNwfmx+HZnUos
         wC4+UOkBgJ9Sywu9MYNIYqvK2dH5gWAxH1fWmMFetFhWgtT9HnYxTOFyH5ykE6lwqPAW
         wdjaRNn1TKN8+Xl3I2cUWTCcJA1L9qd2g4o1XcHcumpKaieE/gGiagJ1FnrlDI9wAi+T
         QgkLT25s2sm4G13L+D1D4oZSVrzCfG5BNXiYcze5WO6y0RlSIaVBE6T6MJFYX3QHrczu
         9lXg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XbSCtwSp;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-43d4a774b1asor2201645e9.10.2025.03.19.23.57.38
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 19 Mar 2025 23:57:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XbSCtwSp;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742453858; x=1743058658; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZPhtlMEyE1t/TeBfGPHO/YBqHcTOXS9vsZ1BLG2PgpE=;
        b=XbSCtwSp6r/7EPTr1rQEayBVymL4gbZZp6SpZNRD0fYwmD8Qt7tK3hDnE8x8vSlxYS
         1fAhiC8mnckaj0x0sdT+grtYAN4UM64hBtM2xTPkOKE06PyPKncxFkGgXrbvOSsDko15
         y3Wubec3ktsh5JiMSVnYWhJSdN+NGB6OTSxioqGtzRBSPvKQGUMVL8nIvY5SAEduR9uL
         yP0xn9WmHA/jjAA8OgwZxMdokfa0xEHBPJS/7X/imRztRzk5kjKtoa/MXznA0RVgbtC8
         9erEsAqpGC+ZT0UIEUNkTcNGe9ZmRgKlil9YhFNvgGQ1ZAzx7MHQiQtZFskNMHepCn3H
         k5pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742453858; x=1743058658;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZPhtlMEyE1t/TeBfGPHO/YBqHcTOXS9vsZ1BLG2PgpE=;
        b=asyf0SkVDEsU4oPgahvt0E2ABApFt6bQZHYrbsXsBltxLXLLY9HyzivQZvBUWrLm10
         Bb5GgutwwQr6pnDO6NvernT/vf0l26RE5mIfK3vduo//mp7RRf/rG2jkUB1QbKiMkne7
         76vMEYeMi1XanFLu3rRu/xpLjPjP0JU6D/AoDo7BJI/GB39aWsfSutyvS8wyHOwPxXC2
         R7J216L2jPkFOYd/3mnRESfn7DToXkLyXwSgttrG7QlkvJc5pd6JEqutBWX/uPuQBmTZ
         9O59YB/yZfv9OVuwQGvicCA+ri3Z16B5RUSN/tKg7TxogIBHf6GS53qWFqIJXTc2gNDx
         GqhQ==
X-Gm-Message-State: AOJu0YyEmIzmv6mZqAzYIfZE17BXqAcuCojsY8bx7XLdE3mn/zLoTGlA
	RYoUXQAnx58zpfduhQlac8ldKBpYujH3Wwhta/ChkW8ovOTecsxkyUcQyOJRL39ldYBZSfm90Wr
	vTNs=
X-Gm-Gg: ASbGncvwJnRMy5qxp4KlIBECzJ65mTu152g60tJBZHvYThF1WSur8aI5RDZBYjLXewU
	ZIG8PbikjzPSmWnAKGheLPMWJKhfCs3YHNysXrEJqn5bNR+IdEzwAqXSg3zC37Pl3OZ43xUk358
	b76U2y2fFZeYeHPxpD0O4mbLBu1FXayKtINpNyEPEM5YM1b1IDBIrtnuOYCD+EWIOG4b97tutxp
	eTph2nfnHAgH14E/jr7HYk83c8fmOqRIK5c6etD/EPAZ32Jm/w7bETDGpK+eLQuyhFiCwl8cK1l
	OWrcDGM9hmpKICG9/LjsoR68WeeLti2Y7F5i9ajf2MFi2cp08wPoJfM0g9Ip2n3wsK7gJsuVMoM
	QI1f4Wo5KBzCp
X-Google-Smtp-Source: AGHT+IGegxNjbS9SRXWUK8OXQcRKYvTXHPQXNFZKYjMWngHkBslKPyrmXKXTXQR6hJx2n7KbbKTZAg==
X-Received: by 2002:a05:600c:4ec6:b0:43c:f575:e305 with SMTP id 5b1f17b1804b1-43d4378c29emr44900445e9.8.1742453858086;
        Wed, 19 Mar 2025 23:57:38 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.235] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d43f332cfsm39696625e9.6.2025.03.19.23.57.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Mar 2025 23:57:37 -0700 (PDT)
Message-ID: <f6f90393-03db-4cc4-85d6-63212853d08e@linaro.org>
Date: Thu, 20 Mar 2025 07:57:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/10] gdbstub: assert earlier in handle_read_all_regs
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Juan Quintela <quintela@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, Akihiko Odaki <akihiko.odaki@daynix.com>,
 qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
 qemu-s390x@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Peter Xu <peterx@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Hildenbrand <david@redhat.com>, Yonggang Luo <luoyonggang@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Beraldo Leal <bleal@redhat.com>, qemu-arm@nongnu.org,
 Greg Kurz <groug@kaod.org>, Nicholas Piggin <npiggin@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
References: <20250319182255.3096731-1-alex.bennee@linaro.org>
 <20250319182255.3096731-9-alex.bennee@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250319182255.3096731-9-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: V3AuiB2pi7eI

On 19/3/25 19:22, Alex Bennée wrote:
> When things go wrong we want to assert on the register that failed to
> be able to figure out what went wrong.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   gdbstub/gdbstub.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
