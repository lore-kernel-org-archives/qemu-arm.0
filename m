Received: by 2002:a17:906:9c0a:0:0:0:0 with SMTP id ff10csp1745547ejc;
        Tue, 23 Aug 2022 14:40:54 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4+ixxpKG9C33RCSkh/JGQ0ayNRb/fNx3m56vRjxZF3e2ghZ0TU5JCqBoxhz9YQg8ZCI9Hr
X-Received: by 2002:a05:6214:2684:b0:496:de55:8df0 with SMTP id gm4-20020a056214268400b00496de558df0mr10801567qvb.107.1661290854678;
        Tue, 23 Aug 2022 14:40:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661290854; cv=none;
        d=google.com; s=arc-20160816;
        b=TNN8I1Z7L8DzJ0UltFSw3whoG+k0nqt8Kg09qVXxCoa1/b4c37so+/iVbBR3pr409b
         y4I3NLqZacM7KjWXXutUcSvK0zhmXxnFpi6mZ0vxtocD1q8rlJ74yvllGB71n8N7bBEH
         KPS6UwA5srUhCgHOQHruVl5FmhLEGBVJWo8CnNh6iNBNFc2/q/ETiaQumQ7JfnUUlmS6
         sjCztNpukG3vvM2NV6CYrPwlpptYWTO/SpfILd4GPurc+0axL4WNzcReRuOCq3pkcMGu
         A6GNEfzCiu6VA1ljWRkHe0OifQPJ8SQdvdj1jCh9XGeVmIdZevr8RlXK4inXmQoijTU+
         3tjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=YTp4DwPNd+Zw6/iLLv9xLa833uQ8Vjaz3Pg9cG/mACY=;
        b=sW/iRjSw8MS//BRt6o7UUeJvukDYDROp7vC7obhkn8a9aGk0DWHN3TtFg/iQE6BNvo
         fbzWwApPmr2Pet5UucTFtqtKIO3VQudyOJtZT5s9aqTpqBrBw+GrUyJDFfD0J0tbN32Y
         xVokj0w5rrbvVBEOfycbhG8/0pBEmPGhGWtQz5kj8hN6uneUPvoL9DwbmxORV730Eblq
         2NONJKnAOqBPKA4OVAIIoU5lx5uKXJHnrlAfBp1q5mAmHE1k22IDKv7lQyPbEGPHAIzY
         efiNqrwhwh0VqWQi6TK8AB9LP9p+P8WQAaSlFcYIMN3Ye6Rp2zlTAo9liinn2sBMJPhP
         mR8w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="UZx5Br/f";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 84-20020a370457000000b006bbe6e8a80bsi4811161qke.192.2022.08.23.14.40.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Aug 2022 14:40:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="UZx5Br/f";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oQbdl-0005GG-Ti
	for alex.bennee@linaro.org; Tue, 23 Aug 2022 17:40:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQbdW-0005Fz-5g
 for qemu-arm@nongnu.org; Tue, 23 Aug 2022 17:40:38 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:36733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQbdU-0006U4-2f
 for qemu-arm@nongnu.org; Tue, 23 Aug 2022 17:40:37 -0400
Received: by mail-pg1-x533.google.com with SMTP id s206so13377567pgs.3
 for <qemu-arm@nongnu.org>; Tue, 23 Aug 2022 14:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=YTp4DwPNd+Zw6/iLLv9xLa833uQ8Vjaz3Pg9cG/mACY=;
 b=UZx5Br/f0kT/rwv2erHoNODvdhIHD13qumeqqSx9hYE7EsxSOkamV0pjWwvl2/xC8w
 qjILnZv68u8C0iPluyVaRrl/EDUnbaPcaxCF62HKCLM/yjfRg+ms2zygByEpysS9aXjx
 ugdeA8lajhiWlAz83sFYBBb2KnJSQN0Z4eZya25GS7zIc5pc1YieC2r/LQHG4IEnbMKY
 voKu/sOMnI6lSKNZ1vaKph4bP9EoY11XGPVtSy0iase6UqxYa/bHDBoku3S7DtfJUFFc
 Hd4ytDUBLUG7bY81SaEYpQ4mfS+M+d8nWvHyuV7UQktl+fVUdsT7fdOkcTu90PzVnaQo
 5BqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=YTp4DwPNd+Zw6/iLLv9xLa833uQ8Vjaz3Pg9cG/mACY=;
 b=g8ThKcSqmrtjgJJ6JRiy1o92QGQVW3Zpim5tXZS2SMhktW6+gKmvOtrqKdz7R0l6aR
 /9D981REZbdam+9H1lG3vd5sAmwYMdPraDS0aseIaBJyuMDn5BQxbJ26594mlO9taRSs
 9PgH6Hl9sQ4uPPHhjV6/dQV8/S4t5/KbkbL/WhdrLO+Zn8x5M2rIqzgL88t0q8ESC7T0
 OImHhcSUvYKJWvRbIBwQYAVSsEiA6HMPSgFBq4gu3/2Xd1JKrjirGA39aUVvQl7ado7v
 Ds2mLRnbBcdQS5SQlvhsYTuC4w7+IiHCmY23r5LBPIiKvcNZ8EQENnNnfHQsTE9cs9Qw
 ROgg==
X-Gm-Message-State: ACgBeo3dtcPH6uo6w9ld9NqDPaIMRDP+hhd0KjG4aogYmiT8gOgd0vlW
 JL6BSYfdYFDt6pCLjJHdC+1fug==
X-Received: by 2002:a05:6a00:a8f:b0:530:3c05:4644 with SMTP id
 b15-20020a056a000a8f00b005303c054644mr27179506pfl.79.1661290834502; 
 Tue, 23 Aug 2022 14:40:34 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:46f9:77b4:ec0a:c2d9?
 ([2602:47:d49d:ec01:46f9:77b4:ec0a:c2d9])
 by smtp.gmail.com with ESMTPSA id
 e13-20020a17090ae4cd00b001fabcd994c1sm11824969pju.9.2022.08.23.14.40.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Aug 2022 14:40:33 -0700 (PDT)
Message-ID: <cc3bac11-3806-780b-70f1-9ea10c51fb64@linaro.org>
Date: Tue, 23 Aug 2022 14:40:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2] target/arm: Add cortex-a35
Content-Language: en-US
To: Hao Wu <wuhaotsh@google.com>, peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Joe Komlodi <komlodi@google.com>
References: <20220819002015.1663247-1-wuhaotsh@google.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220819002015.1663247-1-wuhaotsh@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Fch6/hBkm20S

On 8/18/22 17:20, Hao Wu wrote:
> Add cortex A35 core and enable it for virt board.
> 
> Signed-off-by: Hao Wu <wuhaotsh@google.com>
> Reviewed-by: Joe Komlodi <komlodi@google.com>
> ---
>   docs/system/arm/virt.rst |  1 +
>   hw/arm/virt.c            |  1 +
>   target/arm/cpu64.c       | 80 ++++++++++++++++++++++++++++++++++++++++
>   3 files changed, 82 insertions(+)

Thanks, queued to target-arm.next.


r~
