Received: by 2002:a17:907:686:b0:a6f:1bf6:7fc1 with SMTP id wn6csp612682ejb;
        Mon, 10 Jun 2024 04:49:34 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWtDgaL4KKvuMd3xsW/0otg60kz62jtVmjlVgEtlWeX4RdFCBnm/HNdMLQ9I/7OMJjt7O5uIAmi7As2eKcZS57R+3rJ0Ruq
X-Google-Smtp-Source: AGHT+IGyeBVG5+wDcftwlMVp9RqyZ6quDlaD/LZBGdSCx5DnMYURaqHlxJNCnr0utBfuBBtthI8w
X-Received: by 2002:a05:6870:9188:b0:254:7f9f:3f21 with SMTP id 586e51a60fabf-2547fa006d3mr9072979fac.27.1718020174334;
        Mon, 10 Jun 2024 04:49:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718020174; cv=none;
        d=google.com; s=arc-20160816;
        b=Gulmyvb2rJdHEeC9vfKo5qPi3RZC65880cF5ZftC5UhveWuiN3nBddaG8Je7RDidrc
         5pFtOX0FU4klZZPcfGLtPmj3aguTgr7d1fTnY8uBIIesXWD/gj4WQbOd7PBFt37ddqBa
         249Ip+zxtgYFnK5/vBSDQTdgz9RAO/BKtLqZbeKtaC6gDnREJNKo4EZufCzaKy7/JsB4
         fzB3PjAuIccIYj08jHwHf5lgB++MYErPJLLOvFrVSLOFHwOCm3cGRL40ldNVgxzhgXlU
         No4lmfHMYGahcKzDZo6etsplp4DeeLgRTtR6EOJi6POghsSdX8b+y0MlZVZC+EhCPhLF
         yv+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=pa9ymKnAR4hIiL0jEThC5anaSYKiL9fDSMa9S/KtC2Y=;
        fh=0lDLnvc/5fkqFdCICu+sKHD2oc+MZz+yG3bZ+Amo+g0=;
        b=KCa5g8+nQAem14Ma/ocUitXs0WcVBIOb6/vZXbyosb7w7IjI3TgxGa6qavXwf5qTFq
         ONOOO6CGVoADrBU6aaxjd8/imVdu5CpAiL3fdlLfRLWWGAYmXW2SCoweD//UYci6unJG
         enSfNLxqVJjH3zdXNiQogJnNI2TgFRQrZE3BtbM1e6N36IOQRB6GE+/FNnr5VSC1q5hq
         L8aGPkvq6o02m9+blw7WJAVunytGGHnGW4X8DjEBv/9MTDsygcraQ3m70qvZaSxrNxOh
         t3WUTaZRTAZzA53dziLhOPvowytHoiNOpS86BbtQNnYNqtyPax3ZU4PP0xcseNeKMakx
         cMKQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FuWQhkaR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-795515918absi655084085a.502.2024.06.10.04.49.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Jun 2024 04:49:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FuWQhkaR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sGdWO-0002Yg-9O; Mon, 10 Jun 2024 07:49:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sGdWM-0002Xi-6b
 for qemu-arm@nongnu.org; Mon, 10 Jun 2024 07:49:06 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sGdWK-0006m2-Hk
 for qemu-arm@nongnu.org; Mon, 10 Jun 2024 07:49:05 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-42121d27861so37603375e9.0
 for <qemu-arm@nongnu.org>; Mon, 10 Jun 2024 04:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718020142; x=1718624942; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pa9ymKnAR4hIiL0jEThC5anaSYKiL9fDSMa9S/KtC2Y=;
 b=FuWQhkaR4a0pl4luTnjtorADOEOZ9rc0eI2Qa/2BLyxfmkgHna5wdRqjtN9QIeaby0
 +fciIKEFEztgQ7QdNZW3FL36i66ZWv5DiyV78C2vxwL+v+B8xiNLjYvo4t1Q2NA7ZjTw
 aV0QjcQjN3u8xHWRupl+NInsvjRdlnE9Ywm4RN67whPReuqyZ2sav7zxwsb/83IlmzjM
 9wegkMFqeZ2loRN5focPMj48HtcOYS8/PLVcVZkP5eyGygaqi9Nef14t/FnUwursndjK
 6amhxYyxmcAZPEwKUbo1L1ZsErqFXysNYyMIHOd0ZJmeHSKd+YlhoBmcSXdJBmz1mIl+
 kzAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718020142; x=1718624942;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pa9ymKnAR4hIiL0jEThC5anaSYKiL9fDSMa9S/KtC2Y=;
 b=Tj0qpGLtFOZGr7MqhoK9uk4VkuRfA/KVQTMS7ZKVt74lLoiGBLOYR/80nWYH/lsu++
 Azc1Vb5/4KdyDuMxFNfXf1ZBjpObdKpDZoq3+tPKJ4traRMMozhMAisNKj99antOoTsu
 hKEahTxuhhg4TshhLDx9mc4zkuPenQonXTpM3K2w4nJwI0BghmdG9lfJ/AYDgX6UYjag
 Yq0RbqY4EjhTcMdXOOLxu+C6LOGr5D2Rou1XziJnv1yaxqkb1E2NpDtGBTjiYyqcgYkp
 DhqyWtYr3gNQLfwwLsnF4tyWHEacYwixhENIGyej9W4beQudzO/0f1cuBLijFadCGEGb
 vVKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQrwIJW95U3/0LplmU3zC4Oxb2HsIuePcgSv5xEI7fRo2/R7bNhbvM67GKjEjOmfAN8/7duWWTeartyTg6E/rRqNTt
X-Gm-Message-State: AOJu0YyDNhXq1dwUlfsJ147O0AD6/mQ4kVzZXZeEfxFVy0mzF8n2L/+H
 Km7HsvdbntxHT/VzapiBliaZWz0va6yt/jd5dkW8snoyuL1914mjYHrfK/HVQc8=
X-Received: by 2002:a05:600c:154a:b0:421:7e88:821 with SMTP id
 5b1f17b1804b1-4217e883770mr36064695e9.32.1718020141756; 
 Mon, 10 Jun 2024 04:49:01 -0700 (PDT)
Received: from [192.168.69.100] ([176.176.129.242])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4216412972fsm120793155e9.47.2024.06.10.04.49.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jun 2024 04:49:01 -0700 (PDT)
Message-ID: <3a919e08-fcce-48d5-b609-cc97cd3ff22b@linaro.org>
Date: Mon, 10 Jun 2024 13:48:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] hw/dma: Add a trace log for a description loading
 failure
To: "Fea.Wang" <fea.wang@sifive.com>, qemu-devel@nongnu.org
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 "open list:Xilinx Zynq" <qemu-arm@nongnu.org>,
 "Edgar E . Iglesias" <edgar.iglesias@amd.com>,
 Frank Chang <frank.chang@sifive.com>
References: <20240604071540.18138-1-fea.wang@sifive.com>
 <20240604071540.18138-3-fea.wang@sifive.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240604071540.18138-3-fea.wang@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
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
X-TUID: fdGPcLj2dlye

Hi Fea,

On 4/6/24 09:15, Fea.Wang wrote:
> Due to a description loading failure, adding a trace log makes observing
> the DMA behavior easy.
> 
> Signed-off-by: Fea.Wang <fea.wang@sifive.com>
> Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> Reviewed-by: Frank Chang <frank.chang@sifive.com>
> ---
>   hw/dma/trace-events    | 3 +++
>   hw/dma/xilinx_axidma.c | 3 +++
>   2 files changed, 6 insertions(+)


> +# xilinx_axidma.c
> +xilinx_axidma_loading_desc_fail(uint32_t res) "error:%d"

Unsigned format is "%u".

Regards,

Phil.
