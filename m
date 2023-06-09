Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp560204ejb;
        Fri, 9 Jun 2023 11:11:03 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4tKTnbWtxSVhqkuHEeuJCLGrX/mHR08eSLV0mnJJIqYFsq17axjFZ135v11/pNbkk6SIkp
X-Received: by 2002:a05:6214:21c1:b0:619:ca55:9709 with SMTP id d1-20020a05621421c100b00619ca559709mr2858523qvh.21.1686334263221;
        Fri, 09 Jun 2023 11:11:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686334263; cv=none;
        d=google.com; s=arc-20160816;
        b=in6v62FOmd8hNWiVi7m0kJE4o1hJNg6NwNGpuo79yZYUck5zYa59tDEvdOyD86QI2y
         9reWpDtY+5hcMIQJnDsyDwDpOVnJuroaV2TpNSl7mHGlPWixYgfibW3ElZxE1uTlykoc
         zfzsxlVsJXQO5AwIyu1B40QXk14h7aFTh+s9xnXvMhoaK6+1IpV2TLEf5BZZewfbT6Sz
         6SXH5QlP7QwdgBeXnhvmxlKGtXRnY0vysTpb+ra+P4WaxH7TILj6cnnUI71QqkkpvobO
         sr8LksUcLPfH9KMXuFlSoL58BUJdQEDC7XBcEKUIHfmAbExjuti/gs9USks/TbnmD8i+
         oThA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=7gJALwFLV6ROniXEa0cMTQBbhfNRgt7PUtfMOV3wugI=;
        b=iol6CDBHZ4lmHK9ZOGwSr0hadzQUlQrxwtxJG2T19i4Nbnm5NBFRw/AvyhsuDxQJ1q
         swyd0CiW28IbGd2LHTqDwqcx/LD78JiSh1jR71CaPJVxp1sMsvxcKeqfcdIzECefzQcD
         KHZ4GZ7fC2rEXFarLKeaFNii/R1psU+k8+7IiGc0uNwse4PF2Z1er1hu4P5F3d8AjaH9
         SUH1wCzBpKP3KP4az74CbgQWCqZbCAajudz+2yaHVry04HReSsJ9r2lnljk1okvkZXJx
         YdMne7Qhxvg+YVCKNbeASFcyj+8Uvfra+hor1yw/7aP3K7fzyk3l8OpceK/IvFqJwVZ7
         Stvw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=obJDLJ5V;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d6-20020a05621421c600b0061b6c6928besi2762000qvh.257.2023.06.09.11.11.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Jun 2023 11:11:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=obJDLJ5V;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1q7gZY-0007GJ-G2; Fri, 09 Jun 2023 14:10:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q7gZX-0007FW-9m
 for qemu-devel@nongnu.org; Fri, 09 Jun 2023 14:10:51 -0400
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q7gZV-0000Sd-Bz
 for qemu-devel@nongnu.org; Fri, 09 Jun 2023 14:10:51 -0400
Received: by mail-oi1-x22b.google.com with SMTP id
 5614622812f47-38eb2984c82so708340b6e.0
 for <qemu-devel@nongnu.org>; Fri, 09 Jun 2023 11:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686334248; x=1688926248;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7gJALwFLV6ROniXEa0cMTQBbhfNRgt7PUtfMOV3wugI=;
 b=obJDLJ5VrG5imfV33Ui49yM01UiozoziqpryuD6ZNQVHA7QUEyL2f6+mrAN4R1x7kD
 x3gkBeq5FG6/X7ViaI8JEG/BeP2Twy14bqmURujnRcwyvEKyzQkqwazQL+L68qT/kkzm
 +ZEppcNIc7D23ReR80QTFFuy2onA5bNFZTL3HU0OTXhEuLfCkPZgGvVtKUr8TOIUF1sN
 sSvYghLOGMwNQ0lWQ6cdOXPiCIgRpnkr6PbBsZ5Tum3OvG/yZLEG+GDuyby8GXH3WAJS
 kxMh9xgmBCAJYXqT5lfBZIWF26T4frVCWQWuAdeSoQIUK0j4hd8wPS9JMG7f1aZUj96X
 D/0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686334248; x=1688926248;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7gJALwFLV6ROniXEa0cMTQBbhfNRgt7PUtfMOV3wugI=;
 b=cE/G8PGU1agPclocinkDITcIMBJUW/BpZ56F6Jj2YTjcCJhPbLDfULdj5bcP+/EbBJ
 D50t/5YBfkUL9qo+gL7tjVbF8M7XHWYDYKDBHvJnG9I3gn8poRG1Zk2O+k1DQydTYvzL
 C8KB+XLWIcw/mx1iaMS2LNwXhR7PWwCu0S2dQkGh7Q+MK4LKQNSFK4cS3W25pZrerU+/
 AJlWVPAVKH+dyK7iG9ErUAajxsr9Ye9DjibfvTlXSNj1z3G+DROFYutoaXiqAOlOqTwP
 4gixhMWlsTFU9vdNhP0+YjnGYfJlWkPqtipWV0UPjDc9QlI5YJ9TZsTijrcYSAhuUHxs
 peRA==
X-Gm-Message-State: AC+VfDzdKXrrUvZd3qyBDodSqUVSVMnanvcGjHDW/BXAK11Cvd1mA4D2
 H5Ystr5aJl0MmvKFppvS8Z8ArLAQWCAmgbQEkRU=
X-Received: by 2002:a05:6808:1b2b:b0:398:7373:6956 with SMTP id
 bx43-20020a0568081b2b00b0039873736956mr2582214oib.5.1686334246691; 
 Fri, 09 Jun 2023 11:10:46 -0700 (PDT)
Received: from ?IPV6:2602:ae:1598:4c01:20be:c4cb:f609:8cca?
 ([2602:ae:1598:4c01:20be:c4cb:f609:8cca])
 by smtp.gmail.com with ESMTPSA id
 u16-20020a63f650000000b00502f4c62fd3sm3229511pgj.33.2023.06.09.11.10.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Jun 2023 11:10:46 -0700 (PDT)
Message-ID: <a602b2af-5938-81bc-3f7d-8e01663ffc51@linaro.org>
Date: Fri, 9 Jun 2023 11:10:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 01/22] plugins: Remove unused 'exec/helper-proto.h' header
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20230609104717.95555-1-philmd@linaro.org>
 <20230609104717.95555-2-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230609104717.95555-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22b;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22b.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: BKj3kA7Di2HO

On 6/9/23 03:46, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   plugins/core.c | 1 -
>   1 file changed, 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
