Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp1479003njk;
        Thu, 19 Dec 2024 00:25:56 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWf0aFjA9r367S1Yu85UPH/xn+4bZF4qEExnJ43UzYCsJv0nZ+kjoS1t7HE/b5KiNl6UBkPQDuQ+EO7pQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGV3g3udfKddjmWEEDsyPUP7M4t/LJnEo+pA6gYPZmZSZ9sF4qD0gXT/EQ3tM0PuuiotN7I
X-Received: by 2002:a05:620a:4054:b0:7b6:c92e:2e83 with SMTP id af79cd13be357-7b9aa8f386amr423684985a.17.1734596756402;
        Thu, 19 Dec 2024 00:25:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734596756; cv=none;
        d=google.com; s=arc-20240605;
        b=h6I3DyS2f3EmsslguhyPb9FR9vIpATCimU5jx6qJpaz8KYL5gndsS+38DnITFc2iIH
         xV/4hhPPKQtJvt3PEUIjRQKxfB29LRZh1N08TzD8VkqYqfi48w4igpvxQ9nvN+kG3qhU
         FgZnDhqZvKmKgTDxfCV6aNafYL3nE1p7VVXKZjMuyn4yuX1NhYz7UK/VIIkuXlaeVseI
         q2A3hCDHAqf9MrI2g9E6kyzcbOCjypcM8/lHE+t3ciqAIgyTJOduNJiKNgpGGBogbtri
         6jZYhkV/jOWaW7iyHlv2pnFi0L8xRTGaOtkqwFVpsdzcjA43EBk/z3AccGlx3++iblaV
         KV0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=o67QXlwUSaMvrSq2RNzS6auV65CBM03JHc8UWQQqHC0=;
        fh=VmDy1tyxTrm9Voc5jh+LJQbj3bwDTv7O+8Iasb2g2Tw=;
        b=QifCXyYxeJUePIxKgn2OAhrV5EXOtJVdj02iCjXyUFTGmWAw5iA8fSGr7JUwa1h3lE
         uc2zHLV5kfMXjfWhDXDHnEPa/biCm0D+51L5ZbVsaI7B911sJ59Hd5Tn21jbGFRJNKFe
         9i8M1EydS6wSokOVCmkDSiK5k4ggYXsBO0rrE6XaCmXCdHs7GxzgCT+4tPXIasm/HwLq
         KAo2FfBWyv9oAsIhJOXz6no3nmDlMyGqdBZjuL5WDQ6ogKi9dGG74rpPjTu27DP02f0W
         ZBBAAxsWGixDEON4MIuJddqOFRYwErxZWCJ78M5diy77iHsWsle4CzwJp9xaiF+HaW/D
         VD3Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=UozECgo1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46a3ec0466csi9328541cf.692.2024.12.19.00.25.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Dec 2024 00:25:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=UozECgo1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tOBqk-0002MB-2t; Thu, 19 Dec 2024 03:25:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1tOBqd-0002LL-Io
 for qemu-arm@nongnu.org; Thu, 19 Dec 2024 03:25:35 -0500
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1tOBqb-0002JC-CJ
 for qemu-arm@nongnu.org; Thu, 19 Dec 2024 03:25:31 -0500
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-7273967f2f0so630070b3a.1
 for <qemu-arm@nongnu.org>; Thu, 19 Dec 2024 00:25:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1734596727; x=1735201527;
 darn=nongnu.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=o67QXlwUSaMvrSq2RNzS6auV65CBM03JHc8UWQQqHC0=;
 b=UozECgo1bLUOMxAHxSN0T4V53vkKLk8rY0pUTZvuZc1fL5y53eTQiGQyg77wLqy98w
 /pg0ZXkgYwvZNKrU2D01AueWVsfOAfhZeZ0Rxkx45WXVlRhgvvEkye4qPhyLBhDzGtwW
 4dfzY82AFqZ416LWSICoj07X3ty7QnkzTtuRZsJ+jP1s6EyYtus6W7ZyC2wlZpomHdej
 vkBIenr4JeAlfadLaWo2EVQC9i0/fj2azNeMXhZljP4ih8wuX7ofJX5SJziz6NLiBySX
 SGINvrm7W5GaxAAtWGMXmy2m+mmvHD0qj373+cgt7gus+21x5/n3lNtuZrLbyhWGctMp
 fdzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734596727; x=1735201527;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=o67QXlwUSaMvrSq2RNzS6auV65CBM03JHc8UWQQqHC0=;
 b=vsoE5GkHS6/upFTIGfcBuO7uReuPEu766p9Ym/JKijkAwpE9fl5VJaT8ZVBjtRw4sx
 TtOU30oJNNPmPeqEeEr71CDvkPLSL1J8lIawNzw8+0/NOE+9nk6hk93JU3WM4qvzsYIv
 JsGs9AFVzovkhMeVaKyCTkhgk30HQ3303fS+7q0msHIGLZ8QyUbbg4AuKgZ9jk9flRvl
 Crdj/UuFZG0Ae0nZxIw1A3TK4f4ncxaVogcg3CsmTDxmRLQhdOzPYgxz5u6Wn8xHlAOQ
 HPvk9Gt9BW+cMsO1qMYcsbVoaGIvTy0sxxz+A7780xRUYeedEu7IuwJctsQj5Y40ez2J
 Z5CQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUM4B0/pNBfjna9VBiOPb5CnOiwIcwD2X1CdY57nrpwBTkNI8hxSAqGD66pOjvijHX3lUY++wJxUg==@nongnu.org
X-Gm-Message-State: AOJu0YyK+HBovOsAWQkSbkUNiUDjh+7apa8i/VVWewx5ckoJ/qUKgOn3
 7K5qZuabhRm/Ee5UQGxFYz4sUABJL1tS2erQeTR0ioyPw0/J3Jq7butz2yfE9J8=
X-Gm-Gg: ASbGncvWzpWORe27CaEaoNdCZkwbTPG2Cf/utDqEEkNhUJ0/yuw8qRK4/sIOy305Rq1
 JiDS+jLjY5Wvy1wwnh6Yy0EeFWdBCTTBQHaY4AXpIYnY7gL5Yr+QXDtw1OcP79XCr3wyBJVIKmc
 SIMRUUAV/Baq+wrVCjo2ItxqubUKaqdZCQM6BuF7GCyp2Nzsry8Itb+PYwAapPCuYqKSqb9Z1FC
 9qpL/i1OH9w0zq6x6FoYu9iRXKdYrklTJD04nYrTKP879EowG3bzaSkxc135Ewd/7M=
X-Received: by 2002:a05:6a20:7faa:b0:1e1:3970:d75a with SMTP id
 adf61e73a8af0-1e5c74f3244mr3839079637.9.1734596726802; 
 Thu, 19 Dec 2024 00:25:26 -0800 (PST)
Received: from [157.82.203.37] ([157.82.203.37])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72aad90b2dcsm731694b3a.171.2024.12.19.00.25.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Dec 2024 00:25:26 -0800 (PST)
Message-ID: <6c0ed1a4-d416-4d52-bbfd-40faadac35c4@daynix.com>
Date: Thu, 19 Dec 2024 17:25:17 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 41/71] hw/net: Constify all Property
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Beniamino Galvani <b.galvani@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Jason Wang <jasowang@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, Pavel Pisa
 <pisa@cmp.felk.cvut.cz>, Francisco Iglesias <francisco.iglesias@amd.com>,
 Vikram Garhwal <vikram.garhwal@bytedance.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, Stefan Weil <sw@weilnetz.de>,
 Bernhard Beschow <shentey@gmail.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, Steven Lee <steven_lee@aspeedtech.com>,
 Troy Lee <leetroy@gmail.com>, Jamin Lin <jamin_lin@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
 Helge Deller <deller@gmx.de>, Thomas Huth <huth@tuxfamily.org>,
 Aleksandar Rikalo <arikalo@gmail.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, Jan Kiszka <jan.kiszka@web.de>,
 Tyrone Ting <kfting@nuvoton.com>, Hao Wu <wuhaotsh@google.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Jiri Pirko <jiri@resnulli.us>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Sven Schnelle <svens@stackframe.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>, Paul Durrant <paul@xen.org>,
 Rob Herring <robh@kernel.org>, "open list:Allwinner-a10"
 <qemu-arm@nongnu.org>, "open list:e500" <qemu-ppc@nongnu.org>,
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
References: <20241213190750.2513964-1-richard.henderson@linaro.org>
 <20241213190750.2513964-46-richard.henderson@linaro.org>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20241213190750.2513964-46-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x431.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-TUID: 5t434bMEYJ9j

On 2024/12/14 4:07, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>
