Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp4172615ejc;
        Tue, 17 Oct 2023 13:10:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGpnGZmesG70a3404TBzz8lFNmfvZ/RK6xVV+w34UVXsSkm8a6vdp9/aBJW+T4COh6+CAUV
X-Received: by 2002:a05:6102:2051:b0:457:c052:1949 with SMTP id q17-20020a056102205100b00457c0521949mr3785227vsr.25.1697573444880;
        Tue, 17 Oct 2023 13:10:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697573444; cv=none;
        d=google.com; s=arc-20160816;
        b=O191izUJFPSUjXnBcpuQrqrzFoO8GXx+IPlS2hT2RBpQ6iLkwlIPy20rDc1cDrL7fV
         XqkA7IiR8LhlHre/diN697S1PKkVGn9wD24/4uhuCFF3/Volxl4LnLD1jV3aqAhxNbMQ
         4Hz+1ibBesDUsZVK5FX2GSsPisPSy8ZDukgV7oNoZHJ297eNAKrPxG3p0/7oUzgYM2gQ
         NAro0dQxgfBhv99YZTdM5RHEgkWqgTED+w6YtQla2Vyy5Lihmi16YUaGKE6aWChuEQ2Z
         0mfrmOFsA/hGl8rQU/9S6BfrKj4HEOvC8zWe6pu8pg8CK+SCH59Zhychq2oDVCmh718X
         VsVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=U23o4OOwj4qPRPlIw1d0Vdg+CJ+lgeeN6m5pLnyfQI4=;
        fh=hOIYQAkp+qllEZGDaNYMtbC69yK4JPmV8Zv5L5YpIPE=;
        b=eVRy8bUKK+Nsxli1rtYDwWs84jhnl3oTcOOlqRST1hyu74ANFkXiZNT6pRX1P2Tbho
         k1O5xZPI6z0G0FF5t/Ya+DK/dFQagD//aEzyUfjg4MkdF6BrDM2PeRtyvHBzsj6ZYx0k
         WsAa1pYWxEaI9e+siyhmpX/TWPiB3aphJqaqm0pqDZ16jPh1GiL+IK1HTDCsNQpTVvAE
         k5zxNzxJ2ho2wxKzUXIJZGqR2UCzc9ioN75wBKsr3SUrJMoV4UWciJ/zqNo8To99RqOW
         EkBKin9fC/aKZKO8oSeuuexnhVwQVF7CDQ31GMTP+fvEULZ8Ap5jzQ958ueFWWoJ51co
         atcQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=uWb+jgWg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t11-20020a05622a01cb00b0041817f70871si1641972qtw.510.2023.10.17.13.10.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Oct 2023 13:10:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=uWb+jgWg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qsqOh-0004Vg-1f; Tue, 17 Oct 2023 16:10:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1qsqOf-0004Po-9L; Tue, 17 Oct 2023 16:10:34 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1qsqOd-0006Li-0G; Tue, 17 Oct 2023 16:10:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=U23o4OOwj4qPRPlIw1d0Vdg+CJ+lgeeN6m5pLnyfQI4=; b=uWb+jgWg9KYeTr9ObQllozh4xc
 s7lIZ/2eyV2dUv9legHYNme0qa5tJMCAmRh6mxiE41KVwN9Bm7+YCO6lZWKTd5nVVfimW2wmgeKVx
 0jnGi57xlCqbRCCpW6hpv99PdPCemFkx0PcjG77Txb7muU1FHgsf79fX4Oa8N2XDz75qyjdFiTinH
 BlwmsI+z50XEe+Y2LvfXhTpm9y/maVrP7BNVTxjUPXhGBZsN5golsp0mG2SlcXpWKeZf2wXhMe8lf
 xjnHdXM6oTmAGQO1IB4wJJ+vIUJUWlGiottRAQ9sp7GK7TodRyEjb3LzNmwomVevOLe2HF2x2xHQK
 VKN7Q4N+7NF/sMXjP5ySoyEWALuJ+c7O5eiTE3FvR3U1TLk/tu17WqlalERphABuu/1T1pF1sayYj
 /Eg6pqQP7RAUSyAO9Isnv5WGZqDcpaCnXGVWgvff0ygVUnXSBfKv3Qk9h+8e+55c0RksckTBBqio8
 dyD7V3q4KG8W89SCkJMLsd2F1mg9s/vvADoUxwtqfZyqdyOvAnDKAosKV98Nyj9QhcAmpX0sQvOtC
 0K2SefkvmTz3HWMzSnIdlN16C3z5rBDXUCyyaeoqbSnRNP2F4SKtbY0gd93JcxecZsO/bEaTMfCPb
 KQI7N5DzwqNW1OnhEPrXr5ZI78jiDZDceTOHKuy8g=;
Received: from [2a00:23c4:8bb0:3200:407d:a65c:9fb4:b9b4]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1qsqOR-0001am-Na; Tue, 17 Oct 2023 21:10:23 +0100
Message-ID: <88a49583-d4a0-4c86-a26b-b98803630d1e@ilande.co.uk>
Date: Tue, 17 Oct 2023 21:10:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Fam Zheng <fam@euphon.net>, qemu-arm@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-block@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, Gerd Hoffmann <kraxel@redhat.com>
References: <20231017140150.44995-1-philmd@linaro.org>
 <20231017140150.44995-4-philmd@linaro.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Autocrypt: addr=mark.cave-ayland@ilande.co.uk; keydata=
 xsBNBFQJuzwBCADAYvxrwUh1p/PvUlNFwKosVtVHHplgWi5p29t58QlOUkceZG0DBYSNqk93
 3JzBTbtd4JfFcSupo6MNNOrCzdCbCjZ64ik8ycaUOSzK2tKbeQLEXzXoaDL1Y7vuVO7nL9bG
 E5Ru3wkhCFc7SkoypIoAUqz8EtiB6T89/D9TDEyjdXUacc53R5gu8wEWiMg5MQQuGwzbQy9n
 PFI+mXC7AaEUqBVc2lBQVpAYXkN0EyqNNT12UfDLdxaxaFpUAE2pCa2LTyo5vn5hEW+i3VdN
 PkmjyPvL6DdY03fvC01PyY8zaw+UI94QqjlrDisHpUH40IUPpC/NB0LwzL2aQOMkzT2NABEB
 AAHNME1hcmsgQ2F2ZS1BeWxhbmQgPG1hcmsuY2F2ZS1heWxhbmRAaWxhbmRlLmNvLnVrPsLA
 eAQTAQIAIgUCVAm7PAIbAwYLCQgHAwIGFQgCCQoLBBYCAwECHgECF4AACgkQW8LFb64PMh9f
 NAgAuc3ObOEY8NbZko72AGrg2tWKdybcMVITxmcor4hb9155o/OWcA4IDbeATR6cfiDL/oxU
 mcmtXVgPqOwtW3NYAKr5g/FrZZ3uluQ2mtNYAyTFeALy8YF7N3yhs7LOcpbFP7tEbkSzoXNG
 z8iYMiYtKwttt40WaheWuRs0ZOLbs6yoczZBDhna3Nj0LA3GpeJKlaV03O4umjKJgACP1c/q
 T2Pkg+FCBHHFP454+waqojHp4OCBo6HyK+8I4wJRa9Z0EFqXIu8lTDYoggeX0Xd6bWeCFHK3
 DhD0/Xi/kegSW33unsp8oVcM4kcFxTkpBgj39dB4KwAUznhTJR0zUHf63M7ATQRUCbs8AQgA
 y7kyevA4bpetM/EjtuqQX4U05MBhEz/2SFkX6IaGtTG2NNw5wbcAfhOIuNNBYbw6ExuaJ3um
 2uLseHnudmvN4VSJ5Hfbd8rhqoMmmO71szgT/ZD9MEe2KHzBdmhmhxJdp+zQNivy215j6H27
 14mbC2dia7ktwP1rxPIX1OOfQwPuqlkmYPuVwZP19S4EYnCELOrnJ0m56tZLn5Zj+1jZX9Co
 YbNLMa28qsktYJ4oU4jtn6V79H+/zpERZAHmH40IRXdR3hA+Ye7iC/ZpWzT2VSDlPbGY9Yja
 Sp7w2347L5G+LLbAfaVoejHlfy/msPeehUcuKjAdBLoEhSPYzzdvEQARAQABwsBfBBgBAgAJ
 BQJUCbs8AhsMAAoJEFvCxW+uDzIfabYIAJXmBepHJpvCPiMNEQJNJ2ZSzSjhic84LTMWMbJ+
 opQgr5cb8SPQyyb508fc8b4uD8ejlF/cdbbBNktp3BXsHlO5BrmcABgxSP8HYYNsX0n9kERv
 NMToU0oiBuAaX7O/0K9+BW+3+PGMwiu5ml0cwDqljxfVN0dUBZnQ8kZpLsY+WDrIHmQWjtH+
 Ir6VauZs5Gp25XLrL6bh/SL8aK0BX6y79m5nhfKI1/6qtzHAjtMAjqy8ChPvOqVVVqmGUzFg
 KPsrrIoklWcYHXPyMLj9afispPVR8e0tMKvxzFBWzrWX1mzljbBlnV2n8BIwVXWNbgwpHSsj
 imgcU9TTGC5qd9g=
In-Reply-To: <20231017140150.44995-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8bb0:3200:407d:a65c:9fb4:b9b4
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 3/7] hw/display/virtio-gpu: Use VIRTIO_DEVICE() macro
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
X-TUID: VGftrfP0mnXd

On 17/10/2023 15:01, Philippe Mathieu-Daudé wrote:

> Access QOM parent with the proper QOM VIRTIO_DEVICE() macro.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/display/virtio-gpu.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
> index 93857ad523..51cb517999 100644
> --- a/hw/display/virtio-gpu.c
> +++ b/hw/display/virtio-gpu.c
> @@ -1132,7 +1132,7 @@ static void virtio_gpu_ctrl_bh(void *opaque)
>       VirtIOGPU *g = opaque;
>       VirtIOGPUClass *vgc = VIRTIO_GPU_GET_CLASS(g);
>   
> -    vgc->handle_ctrl(&g->parent_obj.parent_obj, g->ctrl_vq);
> +    vgc->handle_ctrl(VIRTIO_DEVICE(g), g->ctrl_vq);
>   }
>   
>   static void virtio_gpu_handle_cursor(VirtIODevice *vdev, VirtQueue *vq)

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


ATB,

Mark.

