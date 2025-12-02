Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 829E7D116F6
	for <qemu-arm@archiver.kernel.org>; Tue,  2 Dec 2025 13:20:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vQQJ8-0005z9-D9; Tue, 02 Dec 2025 08:20:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vQQJ7-0005yg-1w
 for qemu-arm@nongnu.org; Tue, 02 Dec 2025 08:20:41 -0500
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vQQJ5-00066h-Gg
 for qemu-arm@nongnu.org; Tue, 02 Dec 2025 08:20:40 -0500
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-789524e6719so79065577b3.1
 for <qemu-arm@nongnu.org>; Tue, 02 Dec 2025 05:20:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1764681638; x=1765286438; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ZbS46Le7oyh4pfgHIhx3/EKDWw+WzT5lTC3ChbRBoFw=;
 b=Rits9/2HmtRnXv2QZa/OhHF1XHzOz6EyNYSADUOri4LLv7CMwmXcbm4GPqDREVtQt7
 YyCh71Vy9ipSsuu3hg1WEHXmnmT8gUJLmhQ0TkVnaVehwImP3DwKEjqMn8c8lWwL7XC6
 TUm7LeFzq/II8NGmJAmNE3Bs1iYJjohGfUA43Iihu4eHY5m+yez7v2n8l2BlrRe3KTFo
 XF0i6Qvi66WRnNHqjr8IhLa8u7Aml60QavrD0UgForCcm1Rz+zYzzflac+hrunEqj3I5
 sULpZmal9fEshb5PPSm9h7Im0uB7wZelZL5zaSJtB/KAv52MpQbIyC9AFJrSw097cqrD
 t6IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764681638; x=1765286438;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZbS46Le7oyh4pfgHIhx3/EKDWw+WzT5lTC3ChbRBoFw=;
 b=CO6MhUOn/Bz4k4zn/WkaKFRDx41msVWovTF2jpKuhpoeaMR6SHZZ/Dnixt8E4E4Vs0
 VaI7JLBTUwcRQZMD1ZPv1OArvJXGhKlZ2vR4NQOn1SP3W++aohVi27KSPiAEfrHDsnHA
 3RO+3v0q6CRU9jdTOsN6KlN4Dpfjt1J/N4FckqMyRAuve9Kpd6Wpy13pIcZAIiTbwgA3
 irZRiL6QjZekIMDaskbFSHc7ad15B78i+E962U/gANMMKbGxk7S8cbp/oAFX09QF2eDj
 tw5/xWUmi2vlEeNNBw85IpYCG+iW1F6vxvAGFXY4p5AuAN5RzP1wjGbc9IEmTMPY4N46
 MPHw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVddctP0j/o83QnhYKUqqCUMq9ZlBKI3YF90dlQcxG1YrD5GfTVpEoknQ9UDjxeyDQ4IAQ1zk24g==@nongnu.org
X-Gm-Message-State: AOJu0YyqPDVJiEXk4FuAWd1iq7HX6HqzMVyXm38Q+5MWj3u3O5eHF6gK
 yDVME429Bif7xbv5asiU60/FmY1TbK1xRfjpeCoyS5xBp3/5ost1qQ3aRmtKrUvFy46IQt0Gtou
 +ZnXBLI7NS9QpJ5KG20ZhQc+3JnftMRv3DSg2IGBrDg==
X-Gm-Gg: ASbGncvsQuil2Ht4NbXiGtsV8Ae9SiBGx2+zWbf0IQKvnzp6LOVPsHNhhCKfeYHIkTb
 lKLxFfxNahAgSr+jXV9EXQVqatyddm1mPHEOpPjNGL5odiCcQpZ19yEw39NvqiyWlTj4dJSXldg
 wqRJXC8zZ8daVwF3smu3eYCtAUpTIKXIH0Eb9wVo0fUHUhmxDwtIeHm0c/kHMVPZZMMm0Kg8Bxn
 z6K2rWeGvWcEJ3IF2CMzcPg5jpciwb/XSEGvPWXvKnE7Va2Qa61npBi8EPlwWvRBPBdIN2G
X-Google-Smtp-Source: AGHT+IFbDdIwWx7XVhFZ2HYqK7MJWY/IQ5E8pWk4PvWwI/wIh4twpVg7DgGfekCeIYkrIG4Uo7UsxOyC/vyQAR7v52A=
X-Received: by 2002:a05:690c:399:b0:78a:834e:b106 with SMTP id
 00721157ae682-78bff634c32mr18700467b3.25.1764681638096; Tue, 02 Dec 2025
 05:20:38 -0800 (PST)
MIME-Version: 1.0
References: <20251127004435.2098335-1-gshan@redhat.com>
 <20251201131729.615abe68@foz.lan>
 <12b7baee-1d6d-440a-a119-971b47d7f3ad@redhat.com>
 <20251201153121.190c22ec@foz.lan>
 <dd43197e-ff56-4adf-a413-03f63d5f5078@redhat.com>
In-Reply-To: <dd43197e-ff56-4adf-a413-03f63d5f5078@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Dec 2025 13:20:26 +0000
X-Gm-Features: AWmQ_bkqFgNduGew7C_ZevHLFJ_sGthu2wIX_qkiURLvF6gbo8GKmy9qMz0-CfU
Message-ID: <CAFEAcA8P9sRUWgKmxrdCiOsMKtVu8gzLUorhR7HLG+ZtzNOL0A@mail.gmail.com>
Subject: Re: [PATCH 0/5] acpi/ghes: Error object handling improvement
To: Gavin Shan <gshan@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, 
 jonathan.cameron@huawei.com, armbru@redhat.com, mst@redhat.com, 
 imammedo@redhat.com, anisinha@redhat.com, gengdongjiu1@gmail.com, 
 pbonzini@redhat.com, shan.gavin@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112f.google.com
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

On Mon, 1 Dec 2025 at 14:38, Gavin Shan <gshan@redhat.com> wrote:
>
> Hi Mauro,
>
> On 12/2/25 12:31 AM, Mauro Carvalho Chehab wrote:
> > On Tue, 2 Dec 2025 00:13:06 +1000
> > Gavin Shan <gshan@redhat.com> wrote:
> >> On 12/1/25 10:17 PM, Mauro Carvalho Chehab wrote:
> >>> On Thu, 27 Nov 2025 10:44:30 +1000
> >>> Gavin Shan <gshan@redhat.com> wrote:
>
> [...]
>
> >>>
> >>> Btw, what setup are you using to test memory errors? It would be
> >>> nice to have it documented somewhere, maybe at
> >>> docs/specs/acpi_hest_ghes.rst.
> >>>
> >>
> >> I don't think docs/specs/acpi_hest_ghes.rst is the right place for that
> >> as it's for specifications.
> >
> > Perhaps not, but it would be nice to have it documented somewhere,
> > either there or at QEMU wiki.
> >
>
> QEMU wiki may be the best place for it. I never updated to QEMU wiki and
> any guiding steps on how to do that?

I think in general we should prefer to document things in docs/
if we think users would want to know them. If it's just a
test setup then perhaps docs/devel, or if feasible actually
make it a test in tests/. The wiki is largely unused except
for the changelog and planning docs.

(In an ideal world we'd check for parts of the wiki that still
have useful-to-users up to date information, and fold them into
our manuals.)

thanks
-- PMM

