Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp1484398lfq;
        Mon, 11 Apr 2022 02:23:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyQ2RUSlIIT0tEpLSGzeLvSOdDZH0fcpBUYg34oldUJYkY192w9JoRlHxGJcnySdm6PHzW0
X-Received: by 2002:a05:620a:bd4:b0:47b:4c75:894e with SMTP id s20-20020a05620a0bd400b0047b4c75894emr21015781qki.425.1649669023634;
        Mon, 11 Apr 2022 02:23:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649669023; cv=none;
        d=google.com; s=arc-20160816;
        b=F16OEXqaUQ0wbR7wQ1TQti8TZwpsF4O7S+PCZR/7hRk7uyY0LXPR5cAeePVa7S+Sw+
         G4CmFevnXdBO7kRFo7IsVSPg7XhStzenE3Q9eMMZNWKQsm7hq2i+O8McDngahFRqVbrv
         fD4u8vSa70ELSbMPdR3nUwUJ2rfPnZ3RAdUsMN0jfB+a701Gh3zYBjC2Dx10WXXMsMP1
         1ybreunTPmBVp3/IR1+5BRbykTBYXMG+A6TTevlzeUfSwqdCt7ES5eAUaBzbuH65UqOR
         dGoNNWiubYhlJ6eWnmfm8TsmnnTAtj1ufLlroNuAoUvDoHyu3ooN5hnEzf7erJFyLfGA
         fWoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jr62P3i98FkTTTfnNY1drZ+Q3dScyC7QAnHClbPPOro=;
        b=Lq6zk7kWjciBl6kRjNRmT/8U0aJeelkpyFvTDg6oQqFk++kK0/DMms14JFzp+/HoZM
         sm33p3J6UHJd8luOvZJ7rDegwXVTAbAAJ9Dx7swrXzCf8HxaYfKDtGeLF2O2rBVs8NrC
         ddYVuP6R7Zn2vmi+cUvi19qeRGcCYY6mDh7OshBHNArQ8JMAg+IABGv3vvaVhFXlVT0a
         581j+1MVPOuy/auav9yrjRK+Cqo3Ns6bc78YNeRruDrduLa2BqEjJXmOchfvXWdQHdXZ
         wYqBTribt8Cano8qn1Y1ZVKJlXpx3vIdel5fTohU/w4B4pkbDajInm5nec930OOO6SEl
         +pDQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=j65als5a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v14-20020a05620a440e00b0067e4be23a07si4757172qkp.588.2022.04.11.02.23.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Apr 2022 02:23:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=j65als5a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ndqGt-00037c-50
	for alex.bennee@linaro.org; Mon, 11 Apr 2022 05:23:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ndqGT-00033w-6c
 for qemu-arm@nongnu.org; Mon, 11 Apr 2022 05:23:17 -0400
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36]:33457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ndqGR-0004eC-H6
 for qemu-arm@nongnu.org; Mon, 11 Apr 2022 05:23:16 -0400
Received: by mail-yb1-xb36.google.com with SMTP id j2so26429194ybu.0
 for <qemu-arm@nongnu.org>; Mon, 11 Apr 2022 02:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jr62P3i98FkTTTfnNY1drZ+Q3dScyC7QAnHClbPPOro=;
 b=j65als5aiezQeNzS4vzBnks9j1XNVT+utF/SROFd7oW3nzIgD9iivh7AoPVYLwAnKe
 JZjaY5TFukVuUs2RRI0hthwCIJkjOIJHs3wrt/XUlirCGfdcmCOFduT4BMRYhU1ofBZI
 FsCO6/v6FSF9Vl5NItsOW5ky+M67dl9srI83ro2jTJ3CKNZtuuVPi3MD/rcbwsiHnYLx
 va/zmrx6VZMTP61TskRj+bAU7Y1/4kb5GWV4+qcEiBGx+vC5KEevPqeuldky421EK2Uz
 woBiWtqN9xYjD3mc+c6aSY+D3GryIineXxIWSWboaJL8iYcXhYTCSLySelhEbJrT7hje
 wBlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jr62P3i98FkTTTfnNY1drZ+Q3dScyC7QAnHClbPPOro=;
 b=TzS+4DGcrgHGpqzS4xmjMezzXGdJJrlxQZrlCmYkUuVpUXQ6t5xcpzKaeMnWC+zIxM
 For77nSOHMUIiTONDJyC0WuMOnVPmDbIy67DhNtnxa2hhmgBqeoi5qCXRe23/smrTFdi
 oKunJ2l88O7c9uIdv2J/Xt4v4HMvXyNTMcYuhNgwtwKAt9biw7w/ZFhkNHRBN5WdQOTz
 2EKtNzWb9QROnu0vEnyKExSlKKEWWiL712R19m6a76H2lXR7JKsBus8iIAWbXdm/PAX0
 zzs2Q0emaeCC2WlcQNyvHBV8ap2uUbVSZo722s7s4jqqsNtn3CFP6RvT9y+g5e6CLOkh
 xBXg==
X-Gm-Message-State: AOAM531c16Ls7xnevKC00JiI2Kzk9TfVxsy7LBAu2ZHGRfpme85Mvm1S
 ghgyUPOUWGhnMD6YFv4lnajgdmfryN8Y/xItngpuhw==
X-Received: by 2002:a25:488:0:b0:641:1c71:b0ff with SMTP id
 130-20020a250488000000b006411c71b0ffmr6839275ybe.39.1649668990542; Mon, 11
 Apr 2022 02:23:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220411065842.63880-1-gshan@redhat.com>
In-Reply-To: <20220411065842.63880-1-gshan@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 Apr 2022 10:22:59 +0100
Message-ID: <CAFEAcA-Tig6PAE4suFnERMN0f_Wco=0UVE7SrWy-Rb7gDheP_Q@mail.gmail.com>
Subject: Re: [PATCH 0/5] target/arm: Support variable sized coprocessor
 registers
To: Gavin Shan <gshan@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb36.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: drjones@redhat.com, agraf@csgraf.de, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, eric.auger@redhat.com, qemu-arm@nongnu.org,
 shan.gavin@gmail.com, pbonzini@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nCWvxB21Gvny

On Mon, 11 Apr 2022 at 07:59, Gavin Shan <gshan@redhat.com> wrote:
>
> There are two arrays for each CPU, to store the indexes and values of the
> coprocessor registers. Currently, 8 bytes fixed storage space is reserved
> for each coprocessor register. However, larger coprocessor registers have
> been defined and exposed by KVM. Except SVE registers, no coprocessor
> register exceeds 8 bytes in size. It doesn't mean large coprocessor registers
> won't be exploited in future. For example, I'm looking into SDEI virtualization
> support, which isn't merged into Linux upstream yet. I have plan to add
> several coprocessor ("firmware pseudo") registers to assist the migration.

So, can you give an example of coprocessor registers which are
not 8 bytes in size? How are they accessed by the guest?
If we need to support them then we need to support them, but this
cover letter/series doesn't seem to me to provide enough detail
to make the case that they really are necessary.

Also, we support SVE today, and we don't have variable size
coprocessor registers. Is there a bug here that we would be
fixing ?

thanks
-- PMM
