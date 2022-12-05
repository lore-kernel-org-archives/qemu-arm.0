Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp3329730ejx;
        Mon, 5 Dec 2022 00:23:54 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7Zb7FUIk9h6CdeGvNaNRZDYqArTQ7SS8GBFNppYykdy6ZT9DVjQpihRkHoe2qVevshGGFt
X-Received: by 2002:ac8:4582:0:b0:3a7:e1db:2fd1 with SMTP id l2-20020ac84582000000b003a7e1db2fd1mr3870804qtn.617.1670228633922;
        Mon, 05 Dec 2022 00:23:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1670228633; cv=none;
        d=google.com; s=arc-20160816;
        b=MOSpI5R0D99nTunMKBmCP3iZ+wlMt/VoC5JTJnFUdKZudOHPmd+RbhDB6RjGRiXPNj
         Ecqw7VGO2Urtzcwr+L+lSHF9oBDVfAhBDHjIijCrLOODLlmoWKUQEqogkV+kziZ55WeO
         Hr1bz9nab7JwO8U3JIhroh55MGOYbLFwvKm0XQS1cAtJA8hzEEymAVfMr3LmC61MHTOQ
         zKjv7zrENBjIN563Bx36LWeq7IUihk0ypJaQxuiTnQp5l8dqpMWJ+ejUAjGFoI7dIEcw
         j9Z1zZP54ZrhoDzADi9ImRJTnIAJtpUSrIfbNYvep/jDS/nxnX/WbuoHRTaqoYNmUOIP
         TSBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:cc:references:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=dYd9RNJ7dS9Pq4AOyck3yoH+nj3xigwdW4b0I8Qief0=;
        b=kY5euouFVSjgHfTa9Rv59shnHU9AHN1A8Ob0QWJU8ajrBm0LlqvDLRXNKEA0bRF+rJ
         jaCreCC36eCJ30IliC+18tmCL9laAVpXSZZTJWah92lwNrbEpOQq3ZcQwdUTQKfhW78+
         38OC2tE1FQjJvDAYqbXh+DuyCpPzKuq/v779nKF4i93IGkQDwD7STEYXWaLTvAtHDdGg
         fgeHU6qfwXUra36Z9gNNiFhykMhjftt7igVoadkWBVZeCZX9RBSpwbgXuFiGccD6iuy/
         QEjo+lEMr+fpK7zshh5OAlG/SAGx5CDVYdlozbNIcAlaaLathg6kuWhJxsfV4b5QqpBf
         ewBQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZcAyfWoA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gy8-20020a056214242800b004c760aab60asi2190606qvb.493.2022.12.05.00.23.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 Dec 2022 00:23:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZcAyfWoA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p26lT-0008Dn-91; Mon, 05 Dec 2022 03:23:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p26lI-0008Bs-IT
 for qemu-arm@nongnu.org; Mon, 05 Dec 2022 03:23:47 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p26lG-0002OC-U9
 for qemu-arm@nongnu.org; Mon, 05 Dec 2022 03:23:40 -0500
Received: by mail-wr1-x42a.google.com with SMTP id u12so16420563wrr.11
 for <qemu-arm@nongnu.org>; Mon, 05 Dec 2022 00:23:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:cc:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dYd9RNJ7dS9Pq4AOyck3yoH+nj3xigwdW4b0I8Qief0=;
 b=ZcAyfWoAJ9I6BHTS6OpSbW2omQOkLKJozDWMtQr3tYYmKC4kfXEZrzrdcjtna0lqcq
 foyYQuTxqA/mcqkm2huVt1guG+5IOob+MM/TTEaPTZ4Nyc8huBQS+InHzL2h0o7dsyGf
 CC8/9Fg6GsBBsNS8JhWz9H3AI63z+znlmbdGvobMajofPvf6EwR2HJJGbXvCSAkuX2tF
 1aOMEfp9PKOBcjqtYI/QkxlYQiEi7ok2mP7at6wOOS/zijvBVI2WPmH0HEHw/3gup2pl
 wtu8QbkxSFx2L/KCViCcVc7l+hJST+kWSw81MFoPWHwAm7Z5iiNnX2qBOwpuLpRRSUdO
 rGcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:cc:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dYd9RNJ7dS9Pq4AOyck3yoH+nj3xigwdW4b0I8Qief0=;
 b=5hE1kdqcTqUGzueNTmB8+9vh2teFTNSGgUStXX2Uu2L04Kjg0yQTLM1JC6dnvE/DK4
 jnaq3YS94zAEyo5wKGsUCc+eA747sPY/b4gIVLDosWjutA/GujT7SVFedqdhdwKPCUtq
 P8GjrtxDjTkMBvsmGPjq7uZxJ8fGuYBLV6+woDhFqZaYHMNekQZXYT6pWnrd2iGFZTcp
 GNde9wzx9Y6s1Sd/AfQ7kFUwRu+w1yy7yPqyV9sN8M6wkTF2zLTeJ9XELauqo6q1LMbR
 xmH6H2l/QcjAwnIBEPUt0XaXjHaMDxIVxIZxLOfLLnpFejqOwn1FF+a8PX7ia2orcsMt
 5N/g==
X-Gm-Message-State: ANoB5plmTj2ITHA3xHU6njwPel04jjHbpHUgvTt6i1BjViuBwLt4vox6
 Qd5Pl/TVgHeIzyl42620BKP4GA==
X-Received: by 2002:a5d:60c2:0:b0:242:358a:50b9 with SMTP id
 x2-20020a5d60c2000000b00242358a50b9mr11228498wrt.239.1670228617428; 
 Mon, 05 Dec 2022 00:23:37 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 v6-20020adfe286000000b00241f467f888sm13561477wri.74.2022.12.05.00.23.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Dec 2022 00:23:37 -0800 (PST)
Message-ID: <dec95b7b-ae39-d0fc-c631-fcf550c0c3cb@linaro.org>
Date: Mon, 5 Dec 2022 09:23:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: REG: TTC Timer
Content-Language: en-US
To: Gowri Shankar <ggowri617@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
References: <CAJWWW5ikmoujzeYw97QEMG0uBCLyR2mypSe_Td4XJXjXHQFnyQ@mail.gmail.com>
Cc: qemu-discuss@nongnu.org, Frederic Konrad <fkonrad@amd.com>,
 Francisco Iglesias <francisco.iglesias@amd.com>,
 Alistair Francis <alistair.francis@wdc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <CAJWWW5ikmoujzeYw97QEMG0uBCLyR2mypSe_Td4XJXjXHQFnyQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.258,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: DllwzqsRNKGg

On 22/11/22 12:27, Gowri Shankar wrote:
> Hi Team,
> 
> Advance Thanks for Your support.
> 
> Could you please clarify one point here?
> I am using a Xilinx ZCU102 machine with QEMU7.1.0.
> 
> I have seen QEMU 7.1.0 release has TTC timers for the Xilinx-zynqmp SoC 
> model.
> url: https://wiki.qemu.org/ChangeLog/7.1 
> <https://wiki.qemu.org/ChangeLog/7.1>
> 
> In this case, can the ZCU102 machine also use the TTC feature?
> If yes and possible, Could you please share the example code snippet?
> -- 
> Thanks & Regards,
> P. Gowrishankar.
> +919944802490

Cc'ing qemu-arm@ mailing list and Xilinx ZCU102 machine developers.

