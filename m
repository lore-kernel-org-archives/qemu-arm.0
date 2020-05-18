Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp2819449lfb;
        Mon, 18 May 2020 01:21:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxOMUNV6sP4AK+8+4pmUmstIBJLkODdnSDozTNcoy4QIQiRAn3QzeX1nMhiwyWBAwbwP1MS
X-Received: by 2002:ac8:ec7:: with SMTP id w7mr203076qti.197.1589790064233;
        Mon, 18 May 2020 01:21:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589790064; cv=none;
        d=google.com; s=arc-20160816;
        b=L+/Q49af4b2BxNlF9nvYtCFnwkcv7hdx3jpHDwTkMw9+qKjRlOFqRVLbI5207A7GWG
         cc+QjMYFYOdV7Ql5+rfPGQ1kljA6qxp4ZzGUh+YhhRsQ8XChCccxUK7D2iVo9iVI3BkJ
         4HPowzUxabYUXfHoeBBYP3/iF+fXPi9U/0u1LS6UXW2KZb9ToOhW2hBiEXSs04MXFJ2f
         XxsSpd9KRZmcknpkDC8fbOA2tZCGtMOAl/XePRgE/d1XyByYV6MheRBaBOrBhulAqaGb
         yf6CytU0OLZaKS8USr7+Y4YW/VZ+DzOY50E1tSlSXjQoU29i4oYjbsu5Be/+GOnAnq2b
         0x6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=sUGxyD3pCqn39kdOLryWobNHkgLQpSK22VX/ahmoU4A=;
        b=J5zs3uUeikZh+uOwPPwpb3XdevpRfKAqQhLv/w7fL+qDmenh/8ud3DjLBs1u+Rmtye
         Urvq7UUNaPo8xPu5f8XquTnAPRmlFZKEQG141Y6M/YM3orPJU30KtBngB9+ZHOSpn7mq
         8OVCAJwZGCISbXt4lDrg+W4ykYCoytLltN+vSfES20K1U7b/oYzNlMNKg6/ibq8xmdRB
         uWmG8UEet3T9xvN+8t0iZQ/4QXjO45f8i/lNRFWCfF4l4dlq0iV93DtIjy4kBqMw+Li+
         Jp6tQR0emXqlYnPbgozHjiqJPCsKLvnV1bsJZ0MHwLrCPRUCgGV1G1wmVfnuCYU5AxM+
         Q8Yw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@adacore-com.20150623.gappssmtp.com header.s=20150623 header.b=rNtxIJHS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r4si5424635qkk.312.2020.05.18.01.21.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 May 2020 01:21:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@adacore-com.20150623.gappssmtp.com header.s=20150623 header.b=rNtxIJHS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:49764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jab1D-0004C3-LT
	for alex.bennee@linaro.org; Mon, 18 May 2020 04:21:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <konrad@adacore.com>)
 id 1jab07-00037O-Ra
 for qemu-devel@nongnu.org; Mon, 18 May 2020 04:19:55 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:40320)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <konrad@adacore.com>)
 id 1jab07-0002na-12
 for qemu-devel@nongnu.org; Mon, 18 May 2020 04:19:55 -0400
Received: by mail-wr1-x444.google.com with SMTP id e16so10685038wra.7
 for <qemu-devel@nongnu.org>; Mon, 18 May 2020 01:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=adacore-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=sUGxyD3pCqn39kdOLryWobNHkgLQpSK22VX/ahmoU4A=;
 b=rNtxIJHSGlUHXJeQAR1okmoHjMpIKFc6km4y/qM7LCFAHorvoShiVwinO9SLRsC8ZS
 jk/0pZLU7R8MdbYVX+z4xnsL0FLbpVJoDtjdcHsFEA5MKHHdKXbbsU6E4ClXVdEl3NF1
 43HvowxJ7w4YJWpggpeSudsExL3ldlpN1fPoRxieJjUpU9yqiMTo0zUJu5tq4VaCkAs2
 bgYZ5guSfYiF/+SA3INKeOGgeALlhXW+ftKpjzUCDleaiMzqgeUmpe/JsUCR2pzprOaC
 whbjUPuzIg5L51wrRxE2SZKjokKib81lygGtr2v0LgH4SRnQrJsnavVOpAuHmss3P8Ja
 3/pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sUGxyD3pCqn39kdOLryWobNHkgLQpSK22VX/ahmoU4A=;
 b=nU3D53QcNOKHLVULX2Umf5KA3WrJG3BIHuWIB82tg13tCGRkqYMpuZbYuO9+Pbc0Mg
 RH8pcgMmH3rTZTyUv3xbDrCorAGD/M9J1O3GmTyVZ0jDhhcmM1xgd0Gb+nL+k7F/VB6H
 2KCq0MBzCdB7bc5J976ewzfMvdjKS0e+HXJz3jO8FryZXjCb+ofAsIgFcWSW2aM9H4su
 hXx1XD7XylQZthPmLZYJT9gOz80lrYQn8bvmutrVp6Z3WPWDRWn/RdwEhuA/s1ln7ccF
 QeQrXURYGdNtVyfRdGVDBzJTxpfysdYowL7uNRdZszL2rpbaOZbCI22trzUCpkFaN6HA
 xuMw==
X-Gm-Message-State: AOAM530O7kCgOocn3FfvdsyXMM/1QTjqANTgnTykBU97P4NnSW+hzslT
 fsq258lPwtGw0AlI36RKvhduIA==
X-Received: by 2002:a5d:61d2:: with SMTP id q18mr17839844wrv.46.1589789993279; 
 Mon, 18 May 2020 01:19:53 -0700 (PDT)
Received: from linux.home ([2a01:cb19:867e:2100:7eef:23e0:9210:3e8])
 by smtp.gmail.com with ESMTPSA id x184sm15843483wmg.38.2020.05.18.01.19.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 May 2020 01:19:51 -0700 (PDT)
Subject: Re: [PATCH 02/24] display/xlnx_dp: Fix to realize "i2c-ddc" and
 "aux-to-i2c-bridge"
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20200518050408.4579-1-armbru@redhat.com>
 <20200518050408.4579-3-armbru@redhat.com>
From: Fred Konrad <konrad@adacore.com>
Message-ID: <d6b1e66a-23be-e38f-1140-9b45618741e7@adacore.com>
Date: Mon, 18 May 2020 10:19:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200518050408.4579-3-armbru@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=konrad@adacore.com; helo=mail-wr1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, berrange@redhat.com,
 ehabkost@redhat.com, Alistair Francis <alistair@alistair23.me>,
 qemu-arm@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 pbonzini@redhat.com, KONRAD Frederic <fred.konrad@greensocs.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XKJLf8ASAFlZ



Le 5/18/20 à 7:03 AM, Markus Armbruster a écrit :
> xlnx_dp_init() creates these two devices, but they're never realized.
> Affects machine xlnx-zcu102.
> 
> I wonder how this ever worked.  If the "device becomes real only on
> realize" thing actually works, then we've always been missing these
> two devices, yet nobody noticed.

I can't tell, but it used to work back in 2016 since these devices were required
to have a working framebuffer.

> 
> Fix by realizing them in xlnx_dp_realize().
> 
> Fixes: 58ac482a66de09a7590f705e53fc6a3fb8a055e8
> Cc: KONRAD Frederic <fred.konrad@greensocs.com>
> Cc: Alistair Francis <alistair@alistair23.me>
> Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: qemu-arm@nongnu.org
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   hw/display/xlnx_dp.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/hw/display/xlnx_dp.c b/hw/display/xlnx_dp.c
> index 3e5fb44e06..bdc229a51e 100644
> --- a/hw/display/xlnx_dp.c
> +++ b/hw/display/xlnx_dp.c
> @@ -1264,9 +1264,13 @@ static void xlnx_dp_realize(DeviceState *dev, Error **errp)
>       DisplaySurface *surface;
>       struct audsettings as;
>   
> +    qdev_init_nofail(DEVICE(s->aux_bus->bridge));
> +
>       qdev_init_nofail(DEVICE(s->dpcd));
>       aux_map_slave(AUX_SLAVE(s->dpcd), 0x0000);
>   
> +    qdev_init_nofail(DEVICE(s->edid));
> +
>       s->console = graphic_console_init(dev, 0, &xlnx_dp_gfx_ops, s);
>       surface = qemu_console_surface(s->console);
>       xlnx_dpdma_set_host_data_location(s->dpdma, DP_GRAPHIC_DMA_CHANNEL,
> 
