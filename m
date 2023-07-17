Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp5846269eje;
        Mon, 17 Jul 2023 10:26:43 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEn9UhZN6LiBcEOGEOOl8BxhbCQDphvKdRP9KxRNHvVz2D3h7rUPyFS6m+eK44svJANtXHd
X-Received: by 2002:a2e:88c9:0:b0:2b6:dc55:c3c7 with SMTP id a9-20020a2e88c9000000b002b6dc55c3c7mr8660924ljk.20.1689614802954;
        Mon, 17 Jul 2023 10:26:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689614802; cv=none;
        d=google.com; s=arc-20160816;
        b=mUoAuRtbN7Ov3rO7ZeRj/fEzIJHaibuX1jeXQ7acxyGe5NQu3N4+wNniqM/ebWsdgO
         YwvkPxvd8sV5OKqmw6luIBkfgA78HTvNJIdC8DCHCxp9xqCXqDcMkr+GmvsbIsv10nVl
         19UObX7O/ywECKhDFrKa9GJjM1M+pjrGPEJ20bNXMKCiU/rtZ8hHKIthafznFIxtdZwP
         86JCAlrs3zrieYq3MN5ymfPNOk7n8Bra3M/jESBm45SnCDmOucp4ttyzCBys6aF/fB7K
         oFAlkb/ehWNVvKa0V6LPms+Ketv9y5fJRkandM1xO8vdgEqIpX3nFryXZyHVD5Y6Qrdl
         nJuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=uyWXUaXJBGn/ZQkN1STyuunia33aswY3b5gERyJ1bV0=;
        fh=oA6BL14K3G5T+rQcdua5hsJlTlR9ieO/Cb0lKvhDHWk=;
        b=GewFOBJOrQloQkyaaz6WCetZxWigm4WSf/So35yuvHImnTsATPht5s+Gp0Wb9nlC44
         xs/YV+VsaBKxr3x9ccbx1ZNrsQP+17qs/Y+rkg0vgBZvsnWhhIhzeuAPHSRh2sNBXYyx
         7YrCccc2DcgVN6jo6jwqXDi2GBdY+aCh8/gTSfpVnaauQcqLf0sMdbbcgY7yrf36tj2L
         KIzHedI9/sWU+UN16D/9ftajZ+hmW6/yLgF6GqdP9mVWa1gftmMqfz/WPXvN5ZJDBVBE
         CiWcZWlL+yYkaQcsRP0z0CFAUvYNsGqW4yP5CcHIkd9rST9y4/vTswNBK6w5dhEXXD7E
         yj1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WxCLBx4Y;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h2-20020a170906854200b0099329b35b84si4652541ejy.425.2023.07.17.10.26.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Jul 2023 10:26:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WxCLBx4Y;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qLRzW-0002ba-HX; Mon, 17 Jul 2023 13:26:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qLRzU-0002aK-DU
 for qemu-devel@nongnu.org; Mon, 17 Jul 2023 13:26:32 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qLRzR-0006QK-J7
 for qemu-devel@nongnu.org; Mon, 17 Jul 2023 13:26:32 -0400
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-315adee6ac8so4691267f8f.2
 for <qemu-devel@nongnu.org>; Mon, 17 Jul 2023 10:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689614787; x=1692206787;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uyWXUaXJBGn/ZQkN1STyuunia33aswY3b5gERyJ1bV0=;
 b=WxCLBx4Yx/TvyVeyudGDIVmMRopPg+nJ9Ul2iezojIhfG8yjC86r1o01YFUmqUwK3M
 wpPriojoBKsLzrTHuo0K/Pl2gtlkaJVqF9ZbqIfjTUc6ylWvxkmYqrPYh4m7Zis6BASm
 iQnpP1Nol5QBDqlCsI0ben/pmb1aYhMb7t5SSY7YA+YyxT3XYl4qQi30/dO3r24SsPgp
 BAFcZDnPxlPINYuFaCYtalvpAZykFWl3ZGH2DIs0Qqh/ae1HLGKdRMo9ZxN1vE3AKb8r
 79vXO8iC7O3yaWg8FvbbRWt35qL+pGs8VLvEj2lnlMFHeFYktvypkmPQmnwD5qjVYzuj
 ZlGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689614787; x=1692206787;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uyWXUaXJBGn/ZQkN1STyuunia33aswY3b5gERyJ1bV0=;
 b=YoFttN+WvZX0lRJ2vBg5R0UeCWoppP4aD/XXhjoUQBezNe1odVSY5NPHfYObQDHxA/
 oU/vmmyh6uOWpehp/WPOtHZvpb49UK8pREjhzYWs6aOfEoy3mgZ5iIZL4AgkhBnb+Yjt
 rHdy3tp8ZvcR4GdjqH/B+jGBVmlq3cnYG/3jYvutj6ZYWSt70BKkweEOIn2q+DYXmd59
 QzBRchpQEbUn7U73yT2C9rJgpI66V1EmAZii68bmsBVbTBXj43fUWFS0IlXjyM7fTOus
 ZwQVUx7RPlgbXXh7ONImWDPF1cj6gtX9eMGM2IdBDPJmYn4b9EfhpU9lRzp8NyyoVcZi
 munw==
X-Gm-Message-State: ABy/qLYlg1er3o9W1ypzsbwsaJUS71i8u/NX87D37cOy+wRsCOZQ6Q1r
 9JqIm9Ah+dQ6b7AdeusHoxOK0g==
X-Received: by 2002:a5d:5505:0:b0:313:f98a:1fd3 with SMTP id
 b5-20020a5d5505000000b00313f98a1fd3mr11214632wrv.27.1689614787570; 
 Mon, 17 Jul 2023 10:26:27 -0700 (PDT)
Received: from [192.168.69.115] ([176.176.144.39])
 by smtp.gmail.com with ESMTPSA id
 n13-20020adff08d000000b0031433443265sm24422wro.53.2023.07.17.10.26.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jul 2023 10:26:27 -0700 (PDT)
Message-ID: <d28e1e4c-0c7c-e527-4f35-46ace2daa734@linaro.org>
Date: Mon, 17 Jul 2023 19:26:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [PATCH for-8.1 v2] hw/virtio-iommu: Fix potential OOB access in
 virtio_iommu_handle_command()
Content-Language: en-US
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, mst@redhat.com,
 jean-philippe@linaro.org
Cc: qemu-stable@nongnu.org, mcascell@redhat.com, taoym@zju.edu.cn
References: <20230717162126.11693-1-eric.auger@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230717162126.11693-1-eric.auger@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.097,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: dXuoSAFdHpZD

On 17/7/23 18:21, Eric Auger wrote:
> In the virtio_iommu_handle_command() when a PROBE request is handled,
> output_size takes a value greater than the tail size and on a subsequent
> iteration we can get a stack out-of-band access. Initialize the
> output_size on each iteration.

A backtrace would be helpful (or reproducer).

> The issue was found with ASAN. Credits to:
> Yiming Tao(Zhejiang University)
> Gaoning Pan(Zhejiang University)
> 
> Fixes: 1733eebb9e7 ("virtio-iommu: Implement RESV_MEM probe request")
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Reported-by: Mauro Matteo Cascella <mcascell@redhat.com>

Did you mean:

Reported-by: Yiming Tao <taoym@zju.edu.cn>

?

> Cc: qemu-stable@nongnu.org
> 
> ---
> - added the Cc: qemu-stable@nongnu.org and copied 2 persons involved
>    in the reporting loop
> ---
>   hw/virtio/virtio-iommu.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

