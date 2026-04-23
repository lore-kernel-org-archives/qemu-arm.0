Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6126EFAD3E7
	for <qemu-arm@archiver.kernel.org>; Thu, 23 Apr 2026 02:43:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wFk1y-0008BK-A4; Wed, 22 Apr 2026 22:43:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wFk1v-0008Ar-Vq
 for qemu-arm@nongnu.org; Wed, 22 Apr 2026 22:43:04 -0400
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wFk1t-0006bd-NB
 for qemu-arm@nongnu.org; Wed, 22 Apr 2026 22:43:03 -0400
Received: by mail-qt1-x835.google.com with SMTP id
 d75a77b69052e-50d7c12e48eso62160021cf.1
 for <qemu-arm@nongnu.org>; Wed, 22 Apr 2026 19:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776912180; x=1777516980; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=EiFy9XwJdeh234xin+KfomtT2Bss6NRDUdl5pm5WMBg=;
 b=kLVOgW6ymd8XDwiyBxpJXsGza0MwNtZtng5LdrnC1AKyatIzSaRZVhhDad9IAViipz
 i1+3RWI3EUZ4PLe4DGAgsrsS58c7eQmUJhuEN+rV3BkLzpCSblbUahto/rLFY03G8+RJ
 5o1YXHriiBmiLYjPeaJEomjbu71ruaApWY5HMwBHsSbbvdp8IAwZUIAW0y4sebSD/MN/
 4pigblBdjlV0IuKZEDkELbiDMkhuLxSNBmFt71H63evN84H2/4tgKx4L60kaH005/+VF
 25QcTWzzzIjPTGwplLRnaPnqpejXlxseLjgcL+UjZfPKpSUsCtWJX9HzDm1iOmF4Qvfv
 UxVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776912180; x=1777516980;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EiFy9XwJdeh234xin+KfomtT2Bss6NRDUdl5pm5WMBg=;
 b=rtlB5Eum1HZq+NdwDSroPiVIlK9xaJJ4v27j5fvyR9XfVtxfZdyHNxvutPaLoFyllI
 3v/ir5O0L472Frk/kKK/ZRnHkh8DL1lQzjT2pnCu57jwRSPHu6s5acYy1d7u5ATt3RBJ
 hC7aT9ZPTIYs7zg2rZ1HSMdyK0uan+2tTpti3CzNm7qoiaCBL4fq/fAW5fvIQ1b7pOte
 QT2TCp3virSt89cmCzRts1RnSLw3WctDPU/9s/wsJk9hbsLMSQENrUoMrjiyVSHwLgNT
 hocY+zCA2aWcp3p9MLh2sqH+E/pXz/tLr+7ncqWX+82S6iO+18lQbW1MXEzBTutI3ec9
 42xw==
X-Forwarded-Encrypted: i=1;
 AFNElJ8WkzNQDj6MarC/6mCj20F1PzIbGfABKqWJB5B5vSguSslXND454/3qv9mQ3VC5sbNiEpvpM/Tn7g==@nongnu.org
X-Gm-Message-State: AOJu0Yxno7OQlBUCS5h+okU2H6oowRJwASJt/MzbGBGUe6HI+LFRh6+k
 mTDD/qU4eVesJhAA6Xy+CePVuaHV7XlElOBlr6po4lZvaoc1iD2aDoKj0ySXaeFni+GLa+4Z8pa
 72f+1DaU=
X-Gm-Gg: AeBDiev+HXAujPoe/28MXpzwCsccsZ3vbwYvbA2QvQydyaLqJ1U+25femB4wth/tK6h
 VxmulWtNKjbI0K/6Iitakgtj+11ulJYvu/cjE8im2VG4XBI1n4mdieoZWIqLUniJmpWbjaxAb3a
 ATaWNNs3b17y+pI9x2jVj+UNSl+Fb6V9eY6nhNQnWzJrA4d4WH55YDYDrGkOScIATCUyzhPvB5u
 vUOfxgk7b4SeK4Qxj0N/t+0rxNI/PoBSQHwUm3Cx+r+ahCOhL9VjWdp37TJc85grYDct/qJZXvz
 rNgTSdpSSyy+GlY+aT6MHUQXrs59C5ay2C/H/guKy28ucaoZkiTYWDTJqKTO7MOGbWBQVISSB0S
 mdMYCbxSrQws5+Pkygoe4MtoUa2YxhOfe7arD1zm+3vuFbrnxjkK3CdK4JTF9koDwdqMRxE/But
 YyQcYbFRdyRhrZyFTIEVgZqIPcCt2NdZ3IXAy5YH5rM7jdW0Mbp3J+lkUXM0HaWg8fvwxj/vg85
 u2qxNtSwimeZUyfORbFqKsSB7PseNq/ZUZXxp0=
X-Received: by 2002:a05:622a:145:b0:50f:340f:ff35 with SMTP id
 d75a77b69052e-50f341004c6mr165560231cf.26.1776912180060; 
 Wed, 22 Apr 2026 19:43:00 -0700 (PDT)
Received: from [10.72.56.227] ([172.59.184.224])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-50e5d5ecffdsm95552371cf.29.2026.04.22.19.42.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Apr 2026 19:42:59 -0700 (PDT)
Message-ID: <42c07a1b-ed6f-4343-92ad-a500b9efc954@linaro.org>
Date: Thu, 23 Apr 2026 12:42:52 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/17] hw/core: Update docs for
 get_phys_addr_{attrs_,}debug
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20260417173105.1648172-1-peter.maydell@linaro.org>
 <20260417173105.1648172-11-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260417173105.1648172-11-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::835;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x835.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 4/18/26 03:30, Peter Maydell wrote:
> Update the documentation for the get_phys_addr_{attrs_,}debug methods
> and wrapper functions to state that they can handle non-page aligned
> addresses and will return the corresponding exact physaddr for them.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   include/hw/core/cpu.h            | 16 +++++++++++-----
>   include/hw/core/sysemu-cpu-ops.h |  4 ++++
>   2 files changed, 15 insertions(+), 5 deletions(-)
> 
> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> index 6dedad535c..0941757c55 100644
> --- a/include/hw/core/cpu.h
> +++ b/include/hw/core/cpu.h
> @@ -746,15 +746,18 @@ void cpu_dump_state(CPUState *cpu, FILE *f, int flags);
>   
>   /**
>    * cpu_get_phys_addr_attrs_debug:
> - * @cpu: The CPU to obtain the physical page address for.
> + * @cpu: The CPU to use for the virtual-to-physical translation
>    * @addr: The virtual address.
>    * @attrs: Updated on return with the memory transaction attributes to use
>    *         for this access.
>    *
> - * Obtains the physical page corresponding to a virtual one, together
> + * Obtains the physical address corresponding to a virtual one, together
>    * with the corresponding memory transaction attributes to use for the access.
>    * Use it only for debugging because no protection checks are done.
>    *
> + * The address need not be page-aligned; the returned address will
> + * be the physical address corresponding to that virtual address.
> + *
>    * Returns: Corresponding physical page address or -1 if no page found.
>    */
>   hwaddr cpu_get_phys_addr_attrs_debug(CPUState *cpu, vaddr addr,
> @@ -762,13 +765,16 @@ hwaddr cpu_get_phys_addr_attrs_debug(CPUState *cpu, vaddr addr,
>   
>   /**
>    * cpu_get_phys_addr_debug:
> - * @cpu: The CPU to obtain the physical page address for.
> + * @cpu: The CPU to use for the virtual-to-physical translation
>    * @addr: The virtual address.
>    *
> - * Obtains the physical page corresponding to a virtual one.
> + * Obtains the physical address corresponding to a virtual one.
>    * Use it only for debugging because no protection checks are done.
>    *
> - * Returns: Corresponding physical page address or -1 if no page found.
> + * The address need not be page-aligned; the returned address will
> + * be the physical address corresponding to that virtual address.
> + *
> + * Returns: Corresponding physical address, or -1 if no page found.

-1 was useful as an error result when any valid result must have been page aligned.  We 
now need a different method to signal failure.

I'll grant that it's *unlikely* that (hwaddr)-1 is valid, as hwaddr is uint64_t, and most 
64-bit guests only have 40 to 56-bit physical address busses, but not all.  So 64-bit 
guests are less likely to make use of the last page than 32-bit guests, but we shouldn't 
leave the API broken like this.


r~

