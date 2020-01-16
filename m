Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp8299296lff;
        Thu, 16 Jan 2020 04:26:24 -0800 (PST)
X-Google-Smtp-Source: APXvYqzpO2Nmsm89pNW/0P+VYV1/145sRAqQ4ALTVBgN6i4bLrZa1zr5qtwBJX/AHMor4+pwDEgY
X-Received: by 2002:a37:4047:: with SMTP id n68mr33009036qka.258.1579177584152;
        Thu, 16 Jan 2020 04:26:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579177584; cv=none;
        d=google.com; s=arc-20160816;
        b=quhcI48hlbbP4QUZ/uepGIklLbiYDngHi3uf/QqEm0ENpg4xkKgZ1lFUMNoP6ogPgU
         hJsRhF4WRlYzqScgc3VPjCXBGdnUkxyZ12V6cDtM17BCuLggEzz1TbcDofFY7IQ3nsBQ
         oorShEWXSWIz9PAkfn6wr6KaaEi0gwSXxmD/YJo+lwie/YBSu+1TvS56eHt9cXYsjn03
         X5KCc1TL8tWPrCIHbboOuxwnX2Dklf8pgFvcflHoFBkcSoqOlXF/8XWS3jBzRvRE5Ph6
         Br96l9i7CrqQoSK1jjNuO/fI5w4qHzKIAwhyEnGsmBFUtG1TFEk2N9wcyXg/+1pXoVxA
         gmPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qC7hBoaIL8oUCA1xX16AOy/PcPLtnMR4zhXz9UbIBh8=;
        b=u9+HnI5ht+qgUFwOkNFmW8zJfaXN+Gd1QMLZSXJrxaThBJ2QlDLAb9/vFyJXfJAAZ3
         Pcr5JAO2pHIMiLlXTyvyJDC/b4i9x1uF22bPO8HzuEvlyIVmE3OKcGTglX7yXdc9vPN4
         mDQdiTmRedkAXHMXRNcUf57/UXxfRrQbFWB1VhzSMk81SOCEecj9HrRo5X2kptMFoub3
         wKseb6BVPGffmbRiTSoNxi+LUq6TNedGO7wNe4KsTnWAvIZ2nYtQT5Fe9rACaqiDnFQD
         YH09ZnNu3XxT92sU5wtlXXDzwgtUwhpdwGXwGP2GNehVU4LpgsUYoXC3lCVUH6bUqUdA
         O17A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LWCkTYNs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i5si12257574qkh.376.2020.01.16.04.26.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Jan 2020 04:26:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LWCkTYNs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1is4EB-0006AN-Id
	for alex.bennee@linaro.org; Thu, 16 Jan 2020 07:26:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33855)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1is4Cn-0004fT-3F
 for qemu-arm@nongnu.org; Thu, 16 Jan 2020 07:24:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1is4Ch-0000w0-M3
 for qemu-arm@nongnu.org; Thu, 16 Jan 2020 07:24:56 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:44979)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1is4Ch-0000uq-Hs
 for qemu-arm@nongnu.org; Thu, 16 Jan 2020 07:24:51 -0500
Received: by mail-ot1-x343.google.com with SMTP id h9so19107916otj.11
 for <qemu-arm@nongnu.org>; Thu, 16 Jan 2020 04:24:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qC7hBoaIL8oUCA1xX16AOy/PcPLtnMR4zhXz9UbIBh8=;
 b=LWCkTYNsBWjgaf7cJPj8Ofy+vDMVLYHWW5kgTp/vzPLycGQXNGJF+eRm1pcEZ/l+AK
 tRE7RVfcY5zEBKCgF1on24P6HMv6dLnm667MlZ+4lSJvP7iKylp618O1bvtP5UZWntcx
 URlQUeO/9sWMFyhoWnEEOlohN1GE5+igbYcjLxlFhQlpHfb/pWcKSPt0wnTvjGJBHpLw
 jnpQB1OzeONRvfPK5DvcY1eo08AWd5dKluEn3CfyzkOeKV1WqaJryy5h09/6I1SJt4Nf
 W8hqUNQiPcOiP4O3zzOTs3TBJzrajqA1kRGClHPlBVvZMMLUpChywGBwn93b+aS3MaPM
 CkYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qC7hBoaIL8oUCA1xX16AOy/PcPLtnMR4zhXz9UbIBh8=;
 b=VNOqHzhigfnyFodt3895Sj6FwGRjHiowKuEQ4ODBCiYtCyyVZYWCN2lPneUNU22EJY
 Hi14AMQNVUlRye82oXHfWdhir4BRIi2UuXkUzmCuOuCeytELHh9AN/rUjyFt03jKXhQc
 ggPgfEnnt4kqwyRNVBZdAXkcepyhqw0gujrOW9FpxNWCnOnTuH0H6q162mr9Qwoc+75j
 EZVkhQjgWbg91ESUZBrp0ev+tmgiCJ0pR6ypv4ci4OPwXpdF+ndjkU3jGCKBYvxUNAAj
 pw1xwGTf7QTktHNjIg9NpccE+mYW9daUl6oRoEWF/1Dyh5y1GE+oMTqRoensIMf1TebN
 +omQ==
X-Gm-Message-State: APjAAAXWFfxDOnxao6lVo/S7LS9+x2qilhlLm/doHWcKtEvcr0xF655f
 5T7UMmoQtQ7gUU/JTj0/9ChUbg75Owza4G/vxWlcTA==
X-Received: by 2002:a05:6830:184:: with SMTP id
 q4mr1741706ota.232.1579177490204; 
 Thu, 16 Jan 2020 04:24:50 -0800 (PST)
MIME-Version: 1.0
References: <20191219064759.35053-1-guoheyi@huawei.com>
 <20191219064759.35053-3-guoheyi@huawei.com>
 <20200105072504-mutt-send-email-mst@kernel.org>
 <CAFEAcA-sduqVO3rrG2V1VsysE2chgd0SnSySvEXFfue-aZN8dg@mail.gmail.com>
 <bbf347fe-c4a4-c5bb-19c2-3a18571b658f@huawei.com>
 <20200115011412-mutt-send-email-mst@kernel.org>
 <7732900c-5490-6483-ca10-71c565e81945@huawei.com>
 <20200115055408-mutt-send-email-mst@kernel.org>
In-Reply-To: <20200115055408-mutt-send-email-mst@kernel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Jan 2020 12:24:38 +0000
Message-ID: <CAFEAcA9AZS=aNBYNntTDNB0k4kORjMFJ6qOimASVV9JWs4VzTA@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm/virt/acpi: remove _ADR from devices identified by
 _HID
To: "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Corey Minyard <cminyard@mvista.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Igor Mammedov <imammedo@redhat.com>, Guoheyi <guoheyi@huawei.com>,
 wanghaibin.wang@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fg8OxeUeAECf

On Wed, 15 Jan 2020 at 10:55, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> Here's a hopefully better patch. Peter does this address the issue?
>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
>
>
> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> index f1ac2d7e96..3ab4872bd7 100644
> --- a/tests/qtest/bios-tables-test.c
> +++ b/tests/qtest/bios-tables-test.c
> @@ -16,7 +16,10 @@
>   * 1. add empty files for new tables, if any, under tests/data/acpi
>   * 2. list any changed files in tests/bios-tables-test-allowed-diff.h
>   * 3. commit the above *before* making changes that affect the tables
> - * Maintainer:
> + *
> + * Contributor or ACPI Maintainer (steps 4-7 need to be redone to resolve conflicts
> + * in binary commit created in step 6):
> + *
>   * After 1-3 above tests will pass but ignore differences with the expected files.
>   * You will also notice that tests/bios-tables-test-allowed-diff.h lists
>   * a bunch of files. This is your hint that you need to do the below:
> @@ -28,13 +31,23 @@
>   * output. If not - disassemble them yourself in any way you like.
>   * Look at the differences - make sure they make sense and match what the
>   * changes you are merging are supposed to do.
> + * Save the changes, preferably in form of ASL diff for the commit log in
> + * step 6.
>   *
>   * 5. From build directory, run:
>   *      $(SRC_PATH)/tests/data/acpi/rebuild-expected-aml.sh
> - * 6. Now commit any changes.
> - * 7. Before doing a pull request, make sure tests/bios-tables-test-allowed-diff.h
> - *    is empty - this will ensure following changes to ACPI tables will
> - *    be noticed.
> + * 6. Now commit any changes to the expected binary, include diff from step 4
> + *    in commit log.
> + * 7. Before sending patches to the list (Contributor)
> + *    or before doing a pull request (Maintainer), make sure
> + *    tests/bios-tables-test-allowed-diff.h is empty - this will ensure
> + *    following changes to ACPI tables will be noticed.
> + *
> + * The resulting patchset/pull request then looks like this:
> + * - patch 1: list changed files in tests/bios-tables-test-allowed-diff.h.
> + * - patches 2 - n: real changes, may contain multiple patches.
> + * - patch n + 1: update golden master binaries and empty
> + *   tests/bios-tables-test-allowed-diff.h
>   */

I think that seems reasonable, but you're the ACPI expert.
As long as the patches on list:
 * can be reviewed by somebody for whether their ACPI changes
   are correct, including whether the golden-master changes are right
 * can be applied by a maintainer without having to do anything
   special
 * don't break bisection

then I'm happy. It sounds like those steps will work for that.

> diff --git a/roms/seabios b/roms/seabios
> index f21b5a4aeb..c9ba5276e3 160000
> --- a/roms/seabios
> +++ b/roms/seabios
> @@ -1 +1 @@
> -Subproject commit f21b5a4aeb020f2a5e2c6503f906a9349dd2f069
> +Subproject commit c9ba5276e3217ac6a1ec772dbebf568ba3a8a55d

You have a stray submodule update in your patch, though :-)

thanks
-- PMM
