Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6869310A88E5
	for <qemu-arm@archiver.kernel.org>; Fri, 27 Mar 2026 14:12:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w67vJ-0000nv-Do; Fri, 27 Mar 2026 10:12:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w67vE-0000Y7-0a
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 10:12:24 -0400
Received: from mail-yx1-xb132.google.com ([2607:f8b0:4864:20::b132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w67vC-0006Es-90
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 10:12:23 -0400
Received: by mail-yx1-xb132.google.com with SMTP id
 956f58d0204a3-64ad9fabd08so2328111d50.2
 for <qemu-arm@nongnu.org>; Fri, 27 Mar 2026 07:12:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774620741; cv=none;
 d=google.com; s=arc-20240605;
 b=SRYc3MdaMgs+zsfhUyLiOMRbhuIB5qQ1c7kn6Z9ekXGmB/WB12VMxq77BKRs0ilUzv
 GvQ56h3J9zBAd0rSwo9ENZ+AytJwqA36lU1Gav8WFIZNuwl9YlyZDekTc61E4B2P4v/l
 0B4UTb1LNsOyuh0fXzx0/J0YI6YzDNgTcUSXSU2jpl8+kcZxVWau2HbTpSQb18AvpbPO
 kwEWwTQDLHQVjdCOsXtKm0masrvg+vNAZfbSnsSSBdD2OQ3ijF719a6qG4X6sNJDY7Iz
 mkD5jpvenfV1+nOJ5lMcijH7XVI0EiCJrPpZDCvaPZATCdU5uYxEy+nGJ4Oi2XT45Kco
 AKVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=DwmiyYtGoJqAEUhTtMs4TtwNly6jB9R+afoAutyJvhI=;
 fh=FCLojbACFJL3C5V8bQZtCn5T6trBhIIaSrfGeB7l6iM=;
 b=ieq8hYv1bkvfriKfB2ckxnEmU4PRxZqTKv1qwRtq3at74IJHrYFFvNGJ80g7SPJ1GS
 mfKoVQuEmjuGpgiHTK+nO8rNmnWgYyyqSJy9v+ZgEopW9bcXba4jSfdhtYS1q4jp2h1r
 CDysYDn2+pjc0UFeSlNraFsLGLAYUFD/jVUcY9ddCL0K59NjkWdxHzAGM7CeTFGPKg3i
 C+9MznodELejbLDecrAaTDvtANa9vGaRcSkvFsVaDS8ysi/4ocUR87iyQl8XLm911ocH
 u2ovNymOS411+ejAIYvjbhaBuXbpELwlD76tRzDh2LHVUh1xKkd2Dzd4noxqcgtg0SDl
 Ps0g==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774620741; x=1775225541; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=DwmiyYtGoJqAEUhTtMs4TtwNly6jB9R+afoAutyJvhI=;
 b=RC9iQvzARgxaRSZYXfAq/IKsJzf6+1eDthrnF/Hj7wibRLnJxxWzWKGCnH33YpJq+y
 85AAX1IaV/1bfjw05EmA7Zsd9JA/UlxGjSm/sN8p0sivOeVwIvAGjXYhezWynTbUK7dL
 CNiVkvzcTDe89z5rjaG2j7eduSjftXtux7Hi1Ly03JvsPLMN4omReSerNj4TUlsccQny
 IakZOEEnAXuBZIpDQYwFslvlwhrayBs3gfNPBTPMCGD6c6UF39L23x8SWtSo+5jsmbPK
 2HWIEvwREjh9uz8UALLnaEPysCY0pqIFWxGHnBphlDonirjYG3q3nW2rUmL1a2yrVz51
 bhGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774620741; x=1775225541;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DwmiyYtGoJqAEUhTtMs4TtwNly6jB9R+afoAutyJvhI=;
 b=YaDBLMSQLrpTRGmoQGKs3Sx5iQ4kfD5u/wZSpNeuHoQHSijm1jwofqishq6fVr+IlR
 DbikwUSSHn2DrLrBUR2RLE0lQ35Y1p5WZsbapt78M5wzjmy0xS8WhgDfCyd4dju/n8rb
 vjwBffq09z0/Xicj+ulofR+U5fPOVCu5lj+hVIxGinYoapp0Jfnkz/el2tkB7pYnIAs3
 eXE3nNfAsISZADiNoe2B0dPnbIGABNS+NuLdTBIAWJctHPueq6cNaGRg4Dpll4ixQyr5
 0+fKbOv/VwBhNBWF4yhJOntfmRTQBoprgzB5oUafMCCyCLvTgvaDLDOCBjbpmy29Bw7Y
 oO4Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUwlMoIIKZ8cbqI8D4YjOCjO5lmQInUhiSQ0+WSvjuS+k6nXC3YZNzMBxwPLzGUZWP4zZCwm7r15A==@nongnu.org
X-Gm-Message-State: AOJu0Yy1M1NpllVFE0UMZEgPkbWLR8uJ02P65G0AtTdGLK33GXkezlWP
 /H9CVPp/yN35E3B8qmJmmSmvNxSvnUpeRe0Wqig+FhUuVLCF/88owhcssq+xNJsSwzbhFPouehu
 DE3oMrPvslnjoHZxLoI+w0aBQ22sN2zXyH0TrrikaNw==
X-Gm-Gg: ATEYQzwx+cVsMK0XGmrA/9Yj/w91PWQ6zBzddyi0ywpLy7SoD9nzPjJ4iysryWOQJz8
 GRNK6qSj1kLOhLB95jaByTjzoNX+dW+0FENoGsibW9arVLgNDHTTxryUYmciGoNYwSWRNKNcuuh
 nF0o77h0Rp1jiP1H7XNvgsAQqJdsEMi4X+OJb9/fxq9JxuSDGdCi+n8HAyBq6nFujsoVOGa2TQH
 wc+ziHbIRVmpsAS3ODAv4sym4zzsEP+0IrEP4drtRUTpiefFefyCCClVGtztegDFLoXYxq24UxU
 5hlbop4phK0khuSa/p/p1vLFQoci7pyVXHNp7ursSSs5+wJTuCFKxf0G8CpDN01nph0=
X-Received: by 2002:a53:d005:0:b0:64f:fd17:806d with SMTP id
 956f58d0204a3-64ffd17b4cbmr1492710d50.64.1774620741030; Fri, 27 Mar 2026
 07:12:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260327134401.270186-1-kkostiuk@redhat.com>
 <20260327134401.270186-5-kkostiuk@redhat.com>
In-Reply-To: <20260327134401.270186-5-kkostiuk@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 27 Mar 2026 14:12:09 +0000
X-Gm-Features: AQROBzC0Po7v_TD4hj1ivk19f6IZ_jZkws9bNEFEW5yubspfFBco_Aru46Dv7U4
Message-ID: <CAFEAcA-7mgMk8oqoL2teS8Phd6Eif0d7HX65VAXXCOZTWndO6w@mail.gmail.com>
Subject: Re: [PATCH v2 04/15] io: Use glib2 instead of strcasecmp/strncasecmp
To: Kostiantyn Kostiuk <kkostiuk@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 qemu-ppc@nongnu.org, kvm@vger.kernel.org, qemu-riscv@nongnu.org, 
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>, 
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, 
 Nicholas Piggin <npiggin@gmail.com>, Harsh Prateek Bora <harshpb@linux.ibm.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Chinmay Rath <rathc@linux.ibm.com>, Glenn Miles <milesg@linux.ibm.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb132.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Fri, 27 Mar 2026 at 13:44, Kostiantyn Kostiuk <kkostiuk@redhat.com> wrote:
>
> This is a change in semantics. g_ascii_strcasecmp() doesn't honour
> locale but strcasecmp() does. But this is OK for at least one reason:
>  (1) QEMU always runs with the C locale so there's not an actual
>      behaviour change here
>  (2) we want the comparison data in HTTP header and it should be a plain
>      ASCII one, not to do weird things with "I" in Turkish locales,
>      so g_ascii_strcasecmp() is better as it's explicit about that
>
> Signed-off-by: Kostiantyn Kostiuk <kkostiuk@redhat.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

