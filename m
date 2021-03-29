Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp3969255lfg;
        Mon, 29 Mar 2021 13:07:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxa5qNwvMRkNIv2fBth8fR3nqyLicSM03TgTkofJNxpq4HDVEijM+aC9G3ATTgbI3DM4Itv
X-Received: by 2002:a6b:d80d:: with SMTP id y13mr21713189iob.75.1617048471651;
        Mon, 29 Mar 2021 13:07:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617048471; cv=none;
        d=google.com; s=arc-20160816;
        b=wSFRJCCtOuLlzHPRwtNVzKe7+hYP8nW3ulISCesTFJ+OP/RvqFuQEIAeekGMgJ4UdA
         6XD94XQgQfaw+mYWRDpe3l54HNnrdzfJEHpvjnSDnDNI1hqf/JQeHbzyZexo8+rKqxyX
         e1fcqzw9paQUoOW5p/6zM9UEEeyW/l22o90jtx166ixUNAQmNf1fn6jjkE/89vxQY9rM
         M9wJ6YNOZPwcYbYxXJozHCDB60KiNrWF6ss1Gzq8njfcz4efVX/BsbsLohbQFPsULQe+
         ELTl+t+bm8svLVnFPhoBf+cKXcOwPCxHSF2impJ72V/kau6vX0/zR4l4VMsULsGGPwQw
         UYww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=PrMSn4LxiUgBmXLrPj22xAdE+PCPcq9h0zn3SA2U/24=;
        b=nwhgUHj1Y1ik8T+IkFXxb4Jqgz5cowEleSKMqYckpvlIvt/zKt2l6qsAAf8RH+1QWk
         RSoSQBL0Y2aztlujdOIuNJVQsgxp2gMZPjuIOXJxwYReHxPBoUCGFR2d/eyDAcagoqoC
         sZ8XSDZR4RljXiks0jJRv7GCA+T+F6+mRrBVkVZ3JFHCAiSk+Olsoo2RnV77G177is/+
         7H58vCP5TVI8H5GGMtdJTv9Ut7HCJ+XxAea/mNAPVyrW7QCOntaoz3elM5uxxrJ3O6C7
         tKgPhdME5GqgdMg8YzW3Fpu92v9JZXASQpT6tji7ZPZkorFeR6tSnutlh4HHSbWgz4wC
         QxHA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=pAElK9pz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t31si14981587jal.89.2021.03.29.13.07.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 29 Mar 2021 13:07:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=pAElK9pz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:46366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lQyAx-0003j1-0O
	for alex.bennee@linaro.org; Mon, 29 Mar 2021 16:07:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <derrick.mckee@gmail.com>)
 id 1lQyAg-0003is-EO
 for qemu-arm@nongnu.org; Mon, 29 Mar 2021 16:07:34 -0400
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729]:45025)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <derrick.mckee@gmail.com>)
 id 1lQyAe-0008K1-Qu
 for qemu-arm@nongnu.org; Mon, 29 Mar 2021 16:07:34 -0400
Received: by mail-qk1-x729.google.com with SMTP id y18so13662325qky.11
 for <qemu-arm@nongnu.org>; Mon, 29 Mar 2021 13:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=PrMSn4LxiUgBmXLrPj22xAdE+PCPcq9h0zn3SA2U/24=;
 b=pAElK9pzACiJneFju69oJLl6dmt949F0RwOSDG6F9X6NkQVo1lFxzmN9LfzXCJrnDY
 OktckvSZx0zo4mUE68W3yBaTh61CjKR8dt4zRYToivFraCVu99I7B/Pq2upsN5ryTP7u
 SfkJBZwbN+a35hgV5K2YhQaZyfsRMOBYcU5huLr3tyDRhAWYVozyrn5tGZlYNcmQFE5r
 03WhgphLro08O6NG93GGdQmbKYKD/B6pDeKXRKvnjNsTTQqtk03lakHE1sohjPr9APy+
 PWMbaVQofxNsvJPtbeY/RtvW+trES9U8n/HptC7dQKe4RvCu26xLe2U4gp83T8w1qK0c
 29Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=PrMSn4LxiUgBmXLrPj22xAdE+PCPcq9h0zn3SA2U/24=;
 b=K9GF+79DfbrXZnwQG26wN+OaCpzHjcVS0sgTbJGdG93XUkMYiAM+pDxIcKkbd0YqKJ
 k8vQbL97AH+Sgs+WnLe7pP3ZALQIXrUYMbNazLzJAR3INXyyMA5oM2VBpySI6LBtCo9G
 +f9TvRyNGqjmbgCrUsnU8himXHrozLv7PHFbkLVX+ggrpVxeFk+g4zAqLoBXyoOYS2VW
 DA0PjLzzo0YLWo7DLPuPjPUCx2WM8Pqwk1hk2TIyjyRFm07p1QKOF/SA3t70rxsDReV1
 pI6eI17CkS5T6Pq8VzhTXM7d2yPXN83FQ8b3mJHSOsUsqFl+FzE6TeTp0ogU+xYOpd1s
 jlLA==
X-Gm-Message-State: AOAM5302PlfrwdClYFby1znWf6KM1u4aDxz0DMlqADOAh6qhCCNdpavZ
 pRIqSl7nrM8PHpJX0xtRpVZbWzbG3WbHL24xYxV6VWqyMj4C9Q==
X-Received: by 2002:ae9:ebc3:: with SMTP id
 b186mr26276450qkg.335.1617048450772; 
 Mon, 29 Mar 2021 13:07:30 -0700 (PDT)
MIME-Version: 1.0
From: Derrick McKee <derrick.mckee@gmail.com>
Date: Mon, 29 Mar 2021 16:07:20 -0400
Message-ID: <CAJoBWHx5DM=zhj10j1ai5T_LO9ScAhFzUezuhGu6a73vn=4_Rg@mail.gmail.com>
Subject: AUTIA authentication sometimes fails
To: "open list:ARM" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::729;
 envelope-from=derrick.mckee@gmail.com; helo=mail-qk1-x729.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hX05yQouf39N

Hi,

I am running across a scenario where a PAC signed code pointer (using
pacia) sometimes does not successfully authenticate despite the signed
pointer and the salt used to sign the pointer are correctly given to a
autia instruction.  Only one particular pointer fails, while others
are correctly authenticated.  Unfortunately, I can't provide a simple
use case, because the behavior is part of a running kernel, and all
the pointers involved are kernel space pointers.  An example of what I
am seeing (not guaranteeing correct assembly, just a gist):

mov x9, 0xffff800009200000
mov x10, 0x20001
pacia x9, x10  // x9 contains 0xff90800009200000
...
mov x9, 0xff90800009200000
mov x10 0x20001
autia x9, x10  // x9 contains invalid pointer

However, this same code with different pointer values correctly
authenticate.  Is there something specific about the kernel and PAC
authentication that I am missing?  Thanks.

-- 
Derrick McKee
Phone: (703) 957-9362
Email: derrick.mckee@gmail.com
