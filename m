Received: by 2002:a17:906:18b1:b0:a2e:1324:ea5c with SMTP id c17csp175540ejf;
        Mon, 15 Jan 2024 03:37:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFC6mVsVonsRvBDUrZ/NF4IuE4fSGA8BA35/nK3/bl3pA6qlGxgqVSZBjdhav3qgbBCUbYR
X-Received: by 2002:ad4:5f4e:0:b0:680:f972:b74a with SMTP id p14-20020ad45f4e000000b00680f972b74amr7546462qvg.0.1705318621065;
        Mon, 15 Jan 2024 03:37:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705318621; cv=none;
        d=google.com; s=arc-20160816;
        b=S3kjrzhwZmT8pprsHxoZqiGeF8sK2p7FR+vDVEiyzJ7iw3604GIaK59xdLYiQEzLqn
         gv0r2PVkBEUmQA9q8nd+A7J/+FoF5lI/Cw1+9I1lDL2wV5kroQH8pF14HDRsol8JnBRN
         1Hqw6gc1t5pqJdMP24+ftHitHu9vjeHM1uxSDOcGuhn5nBpqNEBONoDPkOshgO2NQAn9
         rgK40VSi5YpYDECQ2AkIQgBgdn5WZWJ7IYn5A9IEarRPt8QT+W5fwYMnLe2moAOGEIwZ
         cvPdg6sCwNI/NXOV5W5RdiW8aKuql0MV6q+yJoItmqN/9ORn5wrrdUv7t89W7e2LtoN1
         mNhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=UjmqmkjAgsxS0HIEgdlOON3kGnxfSLvwy8HakattazY=;
        fh=e/bMfGaJ8ZZ/a90UqRfKd95tUYd1eLOpZVI77OlkckA=;
        b=FqpaYa95zsZ3XhNHdo9uom8IC14dDkOO7UwNJr6HZNRngmaXC2Z0GE1KH6PEPVxJXu
         4jo98rttP2IPdfeXy80P6bPkc9uqqGTMRzSPO4BhjHj9njDsFT4jPbCR9geFN1U7ltYo
         ic1hkEpcS6CKNEgc5riNDAk6xbOKJlNm6NC+GxxdNLdBtMoejYtQoKIXTfUxkJJlVXXj
         8DFTwfgGZ5lH0Ys2fJOkGHAYDsXi3ZVV/Nr4WYNUBfgAEyQdaVlP+L9u1lTDX6UNOMV4
         1LiRlAknq728jnHkTVgmb0WKAMpqUU6Owy1LaqzgKll3RdlM7UAMhxYqKYXPl+eSuugV
         0FJw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ePAXnj2Q;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id b4-20020a0ccd04000000b00680b0df26d5si7784278qvm.162.2024.01.15.03.37.00
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jan 2024 03:37:01 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ePAXnj2Q;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1705318620;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=UjmqmkjAgsxS0HIEgdlOON3kGnxfSLvwy8HakattazY=;
	b=ePAXnj2QqC47FIHpkqKablzvTreaw6xZVVX9rDdhU+9Xz5FY622wYTDZQLUtj1AXJeuRZZ
	jCIvKLlBRqIhglP13/h3Pwl4JolJfKqimkns2rsH7gTtQoNy0vjd6eCV69VUH1741cbdXq
	u1giL47TZyMCG9PVdtdOVdAPJe3o/Po=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-680-3wxDCT4BMq-NbFeszloPjw-1; Mon, 15 Jan 2024 06:36:59 -0500
X-MC-Unique: 3wxDCT4BMq-NbFeszloPjw-1
Received: by mail-yb1-f198.google.com with SMTP id 3f1490d57ef6-dbed7ba6545so13323864276.1
        for <alex.bennee@linaro.org>; Mon, 15 Jan 2024 03:36:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705318618; x=1705923418;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UjmqmkjAgsxS0HIEgdlOON3kGnxfSLvwy8HakattazY=;
        b=TxuJLEaMyim973KKPYMMtIfH9kPXdyrgPesu9szPylg4mTy6boHcO20XG1YZW2I+CH
         twhse+patCNHfcJLneccdo/xX53TQfT0Xy3dTZXK3ti9kbcVWm9kGKjyODvzJf7SYrVF
         6oiDJGNTHI2q7PcU46Oq1DxgjwnN7Xz/tC2mC2zb+l6yHrTgfMXTBPWx12OnEwn9TSyM
         HXaQR5lMFMh++tdDVdPES84EkPws+DkP3CIVHpQ2ebkS6yGk6LENbt6byuLv33krwc/R
         Zt2NZosQPqqCnlbqERerPBpnBzjlT9iJSVoLQmFUYY2ztx6iND9MuerEq2/T6L/zZIqY
         3OTQ==
X-Gm-Message-State: AOJu0YyyENpk2gCz3TylCw08+f3XX+GeUCkDwIeEodtmJPE4Se4V4bnZ
	bSRURDKlltN0UBhAW98lfpmD3zDd2cwsGWHcvWVhKZMhfDfXqawMGEeW+hvINS34WgY6/+G1CJo
	LOmX7r9eKvF/lAoMFelgGAZrkVZXmjCvtNE1+Ar/XPrQSKzzs/TiAokrnVhcVuV1x/M/LeO1IkS
	3yh1bK
X-Received: by 2002:a25:6:0:b0:dbe:9fe3:9d24 with SMTP id 6-20020a250006000000b00dbe9fe39d24mr2536859yba.111.1705318618150;
        Mon, 15 Jan 2024 03:36:58 -0800 (PST)
X-Received: by 2002:a25:6:0:b0:dbe:9fe3:9d24 with SMTP id 6-20020a250006000000b00dbe9fe39d24mr2536847yba.111.1705318617791;
        Mon, 15 Jan 2024 03:36:57 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.9] (ip-109-43-176-232.web.vodafone.de. [109.43.176.232])
        by smtp.gmail.com with ESMTPSA id i20-20020a0cab54000000b00680c8115a43sm3327130qvb.36.2024.01.15.03.36.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jan 2024 03:36:57 -0800 (PST)
Message-ID: <cfdbf6d2-404c-4a63-9ee6-24f3d12d8a59@redhat.com>
Date: Mon, 15 Jan 2024 12:36:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/qtest/npcm7xx_watchdog_timer: Only test the corner
 cases by default
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Tyrone Ting <kfting@nuvoton.com>,
 Hao Wu <wuhaotsh@google.com>, qemu-arm@nongnu.org
References: <20240115070223.30178-1-thuth@redhat.com>
 <87r0iikf1o.fsf@draig.linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <87r0iikf1o.fsf@draig.linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: OuAz5UY/syZ9

On 15/01/2024 12.32, Alex Bennée wrote:
> Thomas Huth <thuth@redhat.com> writes:
> 
>> The test_prescaler() part in the npcm7xx_watchdog_timer test is quite
>> repetive, testing all possible combinations of the WTCLK and WTIS
>> bitfields. Since each test spins up a new instance of QEMU, this is
>> rather an expensive test, especially on loaded host systems.
> 
> I'm not against the change but I do not my home machine runs these tests
> in:
> 
>    1/1 qemu:qtest+qtest-arm / qtest-arm/npcm7xx_timer-test        OK              0.18s   180 subtests passed

That's a different test, I think. Look for "watchdog" in its name, please.

> so I do wonder how the system load can cause such a dramatic increase
> for a comparatively simple test.

The watchdog test is executing a new QEMU instance for each test in the 
loop, and that can be quite expensive on a loaded system, I think.

  Thomas
