Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp1160400ejc;
        Tue, 26 Sep 2023 08:01:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHG7laJ8qaDHuotdsspy7F1hStJcuvK77AscbphV29nV6zooMeDOXgGV7JUZSKXESgo3JHB
X-Received: by 2002:a05:6870:238f:b0:1bf:2ad9:8dae with SMTP id e15-20020a056870238f00b001bf2ad98daemr12943251oap.45.1695740509114;
        Tue, 26 Sep 2023 08:01:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695740509; cv=none;
        d=google.com; s=arc-20160816;
        b=zu0IRXPhbE9TBYOmftXZuIj2qp/1qaxG7f5xyD+I32Q9JBfStOTU0FV1N0OebAmAfm
         pnfZJU8Dlls4DgNLH3JN/p8wWoFf6ouAt+uFOls7FGVC11vFwJ9RQL8+p0h/61TD5FVH
         OZKTpwAX+/Xv4tlHZejA+bl9rHc576+4MYlAU6JGQT/G0hsCCgPywVxFQXwNteJoPJET
         JeaPfGCJuO2DLBuETTT1Sqzsf6U2iYCEeM88Rb+1YG50mixVC937GWPhDZg/cnhLJ+eq
         kcXAmDkB5/T4lkvVPfFX3hUnQBbAPj0Rr+Kf5/bAXDHM62xh33dUqWILZ7Md0Nqq5wjZ
         o0qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Nx7rlH8foH/F1f34YMZkp8Yzus3U0IBqFFQEFdjvi94=;
        fh=uM169AtInUOucBzgcl/S6Q8QNPD6R9MmBsZljHHnV50=;
        b=a7AIAXqyyNZlkIxjkRVEaxVwNXfGS1xZYTAkDQ99HWBGIp8vrTpFyvKirGMzQMk7jW
         jSHp6NHkfNKGVreWqmK0P0cAlT9Ce2pX/xrX2drvmjfMGMMGZLG1m7ankkzypcQ7Rg5P
         PujVWqxfqNqZVvzdVzvvoPFQsIV8RT3UqgMN3n7O1EFPfvPv+kP1tIZ5k/w7aHp3PnLo
         Hq2xgOS3mvIrmv4axtUw5dA2taVSWk+vvh2aqcSbWjrDhasTtzxAOSSV8P1krKsBxPLM
         cgjWZ73dSERm+F4vYitQJzUrL0f/dEO9MkwFK0DYE3nz3gaZBzPBzYn3NQVLuE34sebE
         rm1g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="J3Jop/mq";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o1-20020a0cf4c1000000b006590667478csi2154825qvm.249.2023.09.26.08.01.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 Sep 2023 08:01:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="J3Jop/mq";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ql9Yw-0001wl-NP; Tue, 26 Sep 2023 11:01:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1ql9Yj-0001uZ-DB
 for qemu-arm@nongnu.org; Tue, 26 Sep 2023 11:01:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1ql9Yb-0001fu-Ve
 for qemu-arm@nongnu.org; Tue, 26 Sep 2023 11:01:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695740458;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Nx7rlH8foH/F1f34YMZkp8Yzus3U0IBqFFQEFdjvi94=;
 b=J3Jop/mq4d+6N2pweXxSfmkdzAsjUwAfFK7HNw7Mapnrxeu4NdNFcX7SQC3h1wisS5N2xb
 qbtKAjPp7cxEJYGAPi0n5XCECyqx3lGuOfuNu9tNjJ6P/SEUNjKYWQn26/6pbmVFKLRE9c
 ofdOm8tArFxrxHTBiyEZMEqTQRgQ2D8=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-685-Kc3nB__9OuKKCl4BBPXzMQ-1; Tue, 26 Sep 2023 11:00:57 -0400
X-MC-Unique: Kc3nB__9OuKKCl4BBPXzMQ-1
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7740be79da3so1722871385a.3
 for <qemu-arm@nongnu.org>; Tue, 26 Sep 2023 08:00:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695740455; x=1696345255;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Nx7rlH8foH/F1f34YMZkp8Yzus3U0IBqFFQEFdjvi94=;
 b=wJ1xwrBnroT26ppQoyq1KQI5p6x8ALj4nMAeFbqnesCtiK/jm/6/vG2K13I0eGhUNC
 Il5FbN9JsnvyQgkT7hfSkzoJiweYI+/Qk3QfUA2y9yyyMnlNHd+dWeemOQbylYmY4Ixo
 gSS045QKdHLupA0An8CYw1Mg6z7E/GOZgPNvIpHZz/mUb1EE/QWERXpZu2vwFTRk0Upf
 h+1w63u9YcImrPM2xCzYZ2ExdyEkKubR7hQkPZr8iDf56PtO0efG70CweNDFsNhGs4pF
 SSaErf6ia/WymDFUnTcMZfSnKweXZ/qc/vWy6ZQsAJ8ELk7D/qMxqvy/DzsOlH5WoM0W
 nbKw==
X-Gm-Message-State: AOJu0YwinEqnTfO2zdrLI7f2Rggjx5RSEofk39haxTPHF7o/7JOgQa15
 XQ4pYbri/BUlXyV/scqOrSCh0XbZK/IXJPwBxaug+uJrAoXVl8Y7rBTuipudLbPxqS7n7a5rUj5
 fyCPfSq5ol6WDDXfClsA6
X-Received: by 2002:a05:620a:4112:b0:774:127a:85ac with SMTP id
 j18-20020a05620a411200b00774127a85acmr10395196qko.55.1695740455453; 
 Tue, 26 Sep 2023 08:00:55 -0700 (PDT)
X-Received: by 2002:a05:620a:4112:b0:774:127a:85ac with SMTP id
 j18-20020a05620a411200b00774127a85acmr10395159qko.55.1695740455067; 
 Tue, 26 Sep 2023 08:00:55 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 m19-20020ae9e713000000b0076c8fd39407sm1768998qka.113.2023.09.26.08.00.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Sep 2023 08:00:54 -0700 (PDT)
Message-ID: <d66963e7-d69e-f59d-ca3d-78a98b57424d@redhat.com>
Date: Tue, 26 Sep 2023 17:00:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 4/4] hw/arm/smmuv3-internal.h: Don't use locals in
 statement macros
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>
References: <20230922152944.3583438-1-peter.maydell@linaro.org>
 <20230922152944.3583438-5-peter.maydell@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20230922152944.3583438-5-peter.maydell@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.473,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 8fd5lANE9LBY

Hi Peter,

On 9/22/23 17:29, Peter Maydell wrote:
> The STE_CTXPTR() and STE_S2TTB() macros both extract two halves
> of an address from fields in the STE and combine them into a
> single value to return. The current code for this uses a GCC
> statement expression. There are two problems with this:
>
> (1) The type chosen for the variable in the statement expr
> is 'unsigned long', which might not be 64 bits
>
> (2) the name chosen for the variable causes -Wshadow warnings
> because it's the same as a variable in use at the callsite:
>
> In file included from ../../hw/arm/smmuv3.c:34:
> ../../hw/arm/smmuv3.c: In function ‘smmu_get_cd’:
> ../../hw/arm/smmuv3-internal.h:538:23: warning: declaration of ‘addr’ shadows a previous local [-Wshadow=compatible-local]
>   538 |         unsigned long addr;                                     \
>       |                       ^~~~
> ../../hw/arm/smmuv3.c:339:23: note: in expansion of macro ‘STE_CTXPTR’
>   339 |     dma_addr_t addr = STE_CTXPTR(ste);
>       |                       ^~~~~~~~~~
> ../../hw/arm/smmuv3.c:339:16: note: shadowed declaration is here
>   339 |     dma_addr_t addr = STE_CTXPTR(ste);
>       |                ^~~~
>
> Sidestep both of these problems by just using a single
> expression rather than a statement expr.
>
> For CMD_ADDR, we got the type of the variable right but still
> run into -Wshadow problems:
>
> In file included from ../../hw/arm/smmuv3.c:34:
> ../../hw/arm/smmuv3.c: In function ‘smmuv3_range_inval’:
> ../../hw/arm/smmuv3-internal.h:334:22: warning: declaration of ‘addr’ shadows a previous local [-Wshadow=compatible-local]
>   334 |             uint64_t addr = high << 32 | (low << 12);         \
>       |                      ^~~~
> ../../hw/arm/smmuv3.c:1104:28: note: in expansion of macro ‘CMD_ADDR’
>  1104 |     dma_addr_t end, addr = CMD_ADDR(cmd);
>       |                            ^~~~~~~~
> ../../hw/arm/smmuv3.c:1104:21: note: shadowed declaration is here
>  1104 |     dma_addr_t end, addr = CMD_ADDR(cmd);
>       |                     ^~~~
>
> so convert it too.
>
> CD_TTB has neither problem, but it is the only other macro in
> the file that uses this pattern, so we convert it also for
> consistency's sake.
>
> We use extract64() rather than extract32() to avoid having
> to explicitly cast the result to uint64_t.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/arm/smmuv3-internal.h | 41 +++++++++++++---------------------------
>  1 file changed, 13 insertions(+), 28 deletions(-)
>
> diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
> index 6d1c1edab7b..648c2e37a27 100644
> --- a/hw/arm/smmuv3-internal.h
> +++ b/hw/arm/smmuv3-internal.h
> @@ -328,12 +328,9 @@ enum { /* Command completion notification */
>  #define CMD_TTL(x)          extract32((x)->word[2], 8 , 2)
>  #define CMD_TG(x)           extract32((x)->word[2], 10, 2)
>  #define CMD_STE_RANGE(x)    extract32((x)->word[2], 0 , 5)
> -#define CMD_ADDR(x) ({                                        \
> -            uint64_t high = (uint64_t)(x)->word[3];           \
> -            uint64_t low = extract32((x)->word[2], 12, 20);    \
> -            uint64_t addr = high << 32 | (low << 12);         \
> -            addr;                                             \
> -        })
> +#define CMD_ADDR(x)                             \
> +    (((uint64_t)((x)->word[3]) << 32) |         \
> +     ((extract64((x)->word[2], 12, 20)) << 12))
>  
>  #define SMMU_FEATURE_2LVL_STE (1 << 0)
>  
> @@ -533,21 +530,13 @@ typedef struct CD {
>  #define STE_S2S(x)         extract32((x)->word[5], 25, 1)
>  #define STE_S2R(x)         extract32((x)->word[5], 26, 1)
>  
> -#define STE_CTXPTR(x)                                           \
> -    ({                                                          \
> -        unsigned long addr;                                     \
> -        addr = (uint64_t)extract32((x)->word[1], 0, 16) << 32;  \
> -        addr |= (uint64_t)((x)->word[0] & 0xffffffc0);          \
> -        addr;                                                   \
> -    })
> +#define STE_CTXPTR(x)                                   \
> +    ((extract64((x)->word[1], 0, 16) << 32) |           \
> +     ((x)->word[0] & 0xffffffc0))
>  
> -#define STE_S2TTB(x)                                            \
> -    ({                                                          \
> -        unsigned long addr;                                     \
> -        addr = (uint64_t)extract32((x)->word[7], 0, 16) << 32;  \
> -        addr |= (uint64_t)((x)->word[6] & 0xfffffff0);          \
> -        addr;                                                   \
> -    })
> +#define STE_S2TTB(x)                                    \
> +    ((extract64((x)->word[7], 0, 16) << 32) |           \
> +     ((x)->word[6] & 0xfffffff0))
>  
>  static inline int oas2bits(int oas_field)
>  {
> @@ -585,14 +574,10 @@ static inline int pa_range(STE *ste)
>  
>  #define CD_VALID(x)   extract32((x)->word[0], 31, 1)
>  #define CD_ASID(x)    extract32((x)->word[1], 16, 16)
> -#define CD_TTB(x, sel)                                      \
> -    ({                                                      \
> -        uint64_t hi, lo;                                    \
> -        hi = extract32((x)->word[(sel) * 2 + 3], 0, 19);    \
> -        hi <<= 32;                                          \
> -        lo = (x)->word[(sel) * 2 + 2] & ~0xfULL;            \
> -        hi | lo;                                            \
> -    })
> +#define CD_TTB(x, sel)                                          \
> +    ((extract64((x)->word[(sel) * 2 + 3], 0, 19) << 32) |       \
> +     ((x)->word[(sel) * 2 + 2] & ~0xfULL))
> +
>  #define CD_HAD(x, sel)   extract32((x)->word[(sel) * 2 + 2], 1, 1)
>  
>  #define CD_TSZ(x, sel)   extract32((x)->word[0], (16 * (sel)) + 0, 6)
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric

