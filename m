Received: by 2002:a17:906:ce59:b0:9b2:89ee:1eb8 with SMTP id se25csp1496342ejb;
        Mon, 2 Oct 2023 11:27:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHFJHUe5GUms80cBhYxSACaxW+u0huov4ctejWBlyJJcgBmlKK5PqDz6Jqt4BbyHCqx1Cpt
X-Received: by 2002:ac8:5712:0:b0:418:804:3406 with SMTP id 18-20020ac85712000000b0041808043406mr16344601qtw.39.1696271226027;
        Mon, 02 Oct 2023 11:27:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696271226; cv=none;
        d=google.com; s=arc-20160816;
        b=VxuDUTfVTIzkdT5kHuGWhtq168/7pp2w9LFIKzVWkzuZk4DGrcmusKJxUtIdgp6vn5
         63u72cSxkaLyATEA2st4jONAFZqlgLOL/5fuJsRGAl+iPv6w+YJW4E8vGdxaaDYGgug3
         CYrUKRthnee4Lu+0Ix61CIMDxU4h6S8XvE21OfgRJ5StRIMQXldi9GFJv1eZo3EozVL/
         jn5PR41NfZrZttLlTs0yvRQCCOzFcMKRBSUFACTqRfNbZEtppLZI84GowEewlLV4q6tb
         nWNzmCndJOeKGD9yamIBRyLxCkMLg7vmh/hossl0KZL5wYMYCUOP7IDKQEVrYTblto3c
         orvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=fXN27XwzoteD60cMt972kXTJ4T9Ibx9y54Nbbx/eMUE=;
        fh=+zHgOeezS3BbKnWpYzBLjAU83gkIuJeydFlmcvZ3weo=;
        b=lYwXKkSpqyi0ycC0qG3IyluRd2nge7JjqhQWjel7pzf7T0WJ3BCbYB6vDnURT/BZkq
         4WCBsUhAKjLJx3k3qXbSCtgNNUaLz6ks+JSMBqpYVTSwUgQay4aZ+RmuZZKNROVkFrJI
         oCBwqwLEMBA9Z0jS5bMyegF/+kMX84VF4do7Hv1H5oUiOZixMHX1SJ4ZQNIdadX74ETV
         1fLbWZrHHswnV4aRGqTuE8495NaHzoTmo+Yp+0a+c4rY0avxpLthGm50fkkwsvkKsPgm
         DGCg1SlNAlqyNPufRF7aBVrt9aWQGjGqJX/U9xlhBLkoaIYD6dY6dYTUQ/krw83vQuAl
         OCqw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="RPz/NOm2";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o3-20020ac85a43000000b00411ff2766d0si6246690qta.168.2023.10.02.11.27.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Oct 2023 11:27:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="RPz/NOm2";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qnNdC-0004L0-Oh; Mon, 02 Oct 2023 14:26:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qnNdC-0004Kh-8R
 for qemu-arm@nongnu.org; Mon, 02 Oct 2023 14:26:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qnNd9-0001RO-Nf
 for qemu-arm@nongnu.org; Mon, 02 Oct 2023 14:26:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1696271214;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fXN27XwzoteD60cMt972kXTJ4T9Ibx9y54Nbbx/eMUE=;
 b=RPz/NOm23ZkzRSGgC+GVFEfT/Ys499M4ry5rf4u/mytG0DZlWIo/dxZrxoQNEBpMSwzoB1
 8ZoVUFt6OZ25FqNiJ+26fQ4RHm1lP5bGuvXvWffXV/nRgETg2LDHR1IBO8Vy1hdMVrGrWf
 H+ihUic9ZcjzPIADw2T3DFOPMwmlBnE=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-540-9niuj23dM7q9lyoed8Fwaw-1; Mon, 02 Oct 2023 14:26:51 -0400
X-MC-Unique: 9niuj23dM7q9lyoed8Fwaw-1
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-65af758fa1eso679886d6.2
 for <qemu-arm@nongnu.org>; Mon, 02 Oct 2023 11:26:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696271211; x=1696876011;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fXN27XwzoteD60cMt972kXTJ4T9Ibx9y54Nbbx/eMUE=;
 b=GmQ0t/GOrKQqhwLFmMtuEqKnKTZA6Tw0cM6DCEP7JVMPHpGgf86GNVfGSzLO5DKuBz
 jbc+CeFOzyLq5KHeQC4E1J+tpPkOViX+RVZKwE8JS84GtoF3HOanfdVxSSXBBJS3peVx
 o7mSvL5GVStNi+f/1llO4g32j0RnZm/B9LiKXqseP4qYz+pnAz/C31fX+O4L6fHUIVHU
 8sKQ88wC9u9+jDwJiJdjUrk4rVBxjAStP200uvhdMJhOqfeaNhoCb0XFOSfyWraJiKEd
 lfxZG4U0elv4aLd/TaYk0B0O28iBLbLEMrJQR55u+7IT2g52JBCSSJxArHlxDE30plnf
 dIlA==
X-Gm-Message-State: AOJu0YwY53cKRVRN5RS4TxLm7qRqKxlHyUtvRnhzn0PBI+LqSgk8To7P
 j+NfGejQrWnxC0Nk4VQZVsED3Im5fjZg238056a8tSVon7b10WBTt+SrxViK936c6kizVfDoXHN
 xCcJ6YSoJjukw
X-Received: by 2002:a05:6214:460c:b0:647:2a0e:573f with SMTP id
 oq12-20020a056214460c00b006472a0e573fmr12904176qvb.8.1696271211062; 
 Mon, 02 Oct 2023 11:26:51 -0700 (PDT)
X-Received: by 2002:a05:6214:460c:b0:647:2a0e:573f with SMTP id
 oq12-20020a056214460c00b006472a0e573fmr12904150qvb.8.1696271210755; 
 Mon, 02 Oct 2023 11:26:50 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-177-123.web.vodafone.de.
 [109.43.177.123]) by smtp.gmail.com with ESMTPSA id
 p18-20020ae9f312000000b007756f60bcacsm1871925qkg.79.2023.10.02.11.26.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Oct 2023 11:26:50 -0700 (PDT)
Message-ID: <3d754a9a-a854-f71f-e5e8-c133d23a3cd9@redhat.com>
Date: Mon, 2 Oct 2023 20:26:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] MAINTAINERS: Add section for overall sensors
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Titus Rwantare <titusr@google.com>, Hao Wu <wuhaotsh@google.com>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 Corey Minyard <cminyard@mvista.com>, Joel Stanley <joel@jms.id.au>,
 Kevin Townsend <kevin.townsend@linaro.org>,
 Klaus Jensen <k.jensen@samsung.com>,
 Maheswara Kurapati <quic_mkurapat@quicinc.com>,
 Peter Delevoryas <peter@pjd.dev>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, QEMU Trivial <qemu-trivial@nongnu.org>
References: <20230220110235.24472-1-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230220110235.24472-1-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.321, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
X-TUID: HG0UVoXFS+Wy

On 20/02/2023 12.02, Philippe Mathieu-Daudé wrote:
> Sensor devices depend on some bus, not a particular board.
> While merged for a particular board, sensor devices don't
> depend on it. They depend on a bus technology, and can be
> used by any board exposing such bus.
> 
> In order to help merging sensor patches, when they fall out
> of a particular board tree, add a section covering overall
> sensors, to help out with patch review and merge queue
> handling.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
> Hi, would you like to help co-maintaining?
> 
> Cc: Titus Rwantare <titusr@google.com>
> Cc: Hao Wu <wuhaotsh@google.com>
> Cc: Havard Skinnemoen <hskinnemoen@google.com>
> Cc: Corey Minyard <cminyard@mvista.com>
> Cc: Joel Stanley <joel@jms.id.au>
> Cc: Kevin Townsend <kevin.townsend@linaro.org>
> Cc: Klaus Jensen <k.jensen@samsung.com>
> Cc: Maheswara Kurapati <quic_mkurapat@quicinc.com>
> Cc: Peter Delevoryas <peter@pjd.dev>
> Cc: Cédric Le Goater <clg@kaod.org>
> ---
>   MAINTAINERS | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index fd54c1f140..657fadbd6d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3255,6 +3255,12 @@ M: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
>   S: Maintained
>   F: contrib/elf2dmp/
>   
> +Overall sensors
> +M: Philippe Mathieu-Daudé <philmd@linaro.org>
> +S: Odd Fixes
> +F: hw/sensor
> +F: include/hw/sensor
> +
>   I2C and SMBus
>   M: Corey Minyard <cminyard@mvista.com>
>   S: Maintained

Reviewed-by: Thomas Huth <thuth@redhat.com>

