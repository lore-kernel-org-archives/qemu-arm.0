Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp668130ejc;
        Thu, 19 Jan 2023 14:45:38 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsnYTSNegAyxB0n31IDV6N3ejMtTebeVPDBHLIV0b3RCJWP/ER2p/FCjSvXOM+VrTz6E/UU
X-Received: by 2002:a05:6214:3d9c:b0:535:1b57:ba78 with SMTP id om28-20020a0562143d9c00b005351b57ba78mr22720387qvb.11.1674168338297;
        Thu, 19 Jan 2023 14:45:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674168338; cv=none;
        d=google.com; s=arc-20160816;
        b=PAzAgomVvP46tcDUwOh3zXzHk+veQWN4wcRU9qy3B+p6izEesE1X9Eg5mCE0LCpsjP
         KumxyQXHEnmjWvNKe3ca/UyGo5AaM9sTG9Pr+w3pypbgNOl++Vw2Ik2czuQb8gS//f4b
         Xp2Tuj3vNHcbOnhyp6ndJRBb7YAtWyYg06GlblodSsCEpZ730/AwhYx8aub+UcBcflNE
         vasG16cxs1KR5JzFFA93aAsjX0t4eihuwQ+im0gWKcwoyHo1NLWw8F7M8YK2Wd9HxBJy
         c/9dIEwPJz0l7rkHsZokHiE3kbw3VFbV7RQDRYmaRh+MRmRWlCvhEaw3WVPoB0FKLZVJ
         qXNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=9T2LHo4z/skdJ6o1zjhvO2jeAFrlopB/32iHlHs6Amg=;
        b=EjsV5sh+upLwN4K0izDG7b6GjNaYsdIeP1vwC1LTQmJCa2FtXXxbqXd0SpFykA0NTF
         8zsoIl1xcpPy52c5sMRioPlsf4yKxHSER1lFbXNAL7JxziIQz2NTvILHJgcXu9JM4K4W
         tE7CQ0AEsYgdT7jgenu4tiV26Z6OmWfwR0DpXJX2mJn888eUKJ5i/W8DdjSQc+nWU9F2
         wRcjMzUNhXGslH0FxNpGFoWbDtVZYruzyYyHAiWJ1kF1Zb/t+O3y9ITLa6qfy7PJdDal
         ZJuFNQnqwZX4+3tCY63LpgIoiVzLTN2phttGNkpLixeuWIqIPhO3p14aiA18wPcubzQy
         JyhA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=TUNNMtah;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ob9-20020a0562142f8900b005355fee2af3si339933qvb.245.2023.01.19.14.45.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Jan 2023 14:45:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=TUNNMtah;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIdeh-0006ux-OI; Thu, 19 Jan 2023 17:45:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pIdef-0006u8-Rc; Thu, 19 Jan 2023 17:45:09 -0500
Received: from mail-ua1-x936.google.com ([2607:f8b0:4864:20::936])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pIded-0005FP-D5; Thu, 19 Jan 2023 17:45:09 -0500
Received: by mail-ua1-x936.google.com with SMTP id g12so947831uae.6;
 Thu, 19 Jan 2023 14:45:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=9T2LHo4z/skdJ6o1zjhvO2jeAFrlopB/32iHlHs6Amg=;
 b=TUNNMtahAU4KN1w38tUH9re0LSAGzhLUfOgCz0xcENWF6G6bLtg08Cu3wdmSi1Rgq0
 L9bVNIQdBHvuY3qPxga1XM09Ps6/r/ZMGDEnSU5TN2WLEw21mE3dKL3IM6qDgGtTZXe7
 FjN7W/NGVKTis55LS8NBhY+c9JNuVKVl6QSLMY2CAq5yp0h3FlekzbrU8rUW9ujJAo5I
 UrMeBXuXPRv/MbufEs4AZSB/ZEjkblR27rT/QzaO0FC4/gnqyc/8w2rTOBu2anZq2rD8
 fnX/kA44ieqSTLd5tgY5JCF4zHHXXdKlNm38Lk8nshfg2EZqa2IzAVXFNxr8/lPMdzGl
 1d9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9T2LHo4z/skdJ6o1zjhvO2jeAFrlopB/32iHlHs6Amg=;
 b=fTeNQLwdkrP8duRbgRkz0lbT3ddTq0N0vLzYv0IscUj9DqhufwAg03F3sUlPcKgDnC
 2Qq6GRE+7rlRrqPBMGBKnA9rG3ChPTlCxQnnPRUQ07S384RPvNRxMGG/izI7kJXshLrL
 T/4sl1zA5c2OqXQP03yVzh07ZNXrxbrVx3U8jlXXnmiIG8lyFAerV5c3hezEKCJwtFVc
 0JWFiU37u2LTKOHl3F5QTrff208M4y4cIe9HO+QOdtuGiHmCcZ24hApB114zv9AmeDKY
 1myT3UHbaEJTYAjd5YtGsIi+nVLHeY3zSrtAw/3ZrQiOHlBTBrdWgjGf2rHMdq85kskl
 5dpA==
X-Gm-Message-State: AFqh2kpiDQtn0Xxj9WqpqK3tQzBdd7RJ9QfQ85ktkA2P69h6DKf5e09z
 RtUR1ZnnygCVI0cc/de4vo4WKasvUOudx2s4p50=
X-Received: by 2002:ab0:d89:0:b0:5fe:e440:bec4 with SMTP id
 i9-20020ab00d89000000b005fee440bec4mr1476002uak.96.1674168304879; Thu, 19 Jan
 2023 14:45:04 -0800 (PST)
MIME-Version: 1.0
References: <20230119065959.3104012-1-armbru@redhat.com>
 <20230119065959.3104012-14-armbru@redhat.com>
In-Reply-To: <20230119065959.3104012-14-armbru@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 20 Jan 2023 08:44:38 +1000
Message-ID: <CAKmqyKN5hAzpw8tWPG9WfTXJBzc+Cgh9wc+5EL94Mbs5kqh5OA@mail.gmail.com>
Subject: Re: [PATCH v4 13/19] riscv: Clean up includes
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, richard.henderson@linaro.org, pbonzini@redhat.com, 
 kwolf@redhat.com, hreitz@redhat.com, imp@bsdimp.com, kevans@freebsd.org, 
 berrange@redhat.com, groug@kaod.org, qemu_oss@crudebyte.com, mst@redhat.com,
 philmd@linaro.org, peter.maydell@linaro.org, alistair@alistair23.me, 
 jasowang@redhat.com, jonathan.cameron@huawei.com, 
 kbastian@mail.uni-paderborn.de, quintela@redhat.com, dgilbert@redhat.com, 
 michael.roth@amd.com, kkostiuk@redhat.com, tsimpson@quicinc.com, 
 palmer@dabbelt.com, bin.meng@windriver.com, qemu-block@nongnu.org, 
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::936;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x936.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: IowdFJVsVH2t

On Thu, Jan 19, 2023 at 5:10 PM Markus Armbruster <armbru@redhat.com> wrote:
>
> Clean up includes so that osdep.h is included first and headers
> which it implies are not included manually.
>
> This commit was created with scripts/clean-includes.
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/pmu.h | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/target/riscv/pmu.h b/target/riscv/pmu.h
> index 3004ce37b6..0c819ca983 100644
> --- a/target/riscv/pmu.h
> +++ b/target/riscv/pmu.h
> @@ -16,7 +16,6 @@
>   * this program.  If not, see <http://www.gnu.org/licenses/>.
>   */
>
> -#include "qemu/osdep.h"
>  #include "qemu/log.h"
>  #include "cpu.h"
>  #include "qemu/main-loop.h"
> --
> 2.39.0
>
>
