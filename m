Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp243963ejo;
        Mon, 11 Dec 2023 06:35:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGVB2kIcwMW11IPBGuIBDHzszb8SgUMaUqTZoHVq7xnZ8sGijKY1RzgRvE9whuck1hYMPgU
X-Received: by 2002:a67:fe01:0:b0:464:9c52:d69 with SMTP id l1-20020a67fe01000000b004649c520d69mr2312098vsr.70.1702305338173;
        Mon, 11 Dec 2023 06:35:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702305338; cv=none;
        d=google.com; s=arc-20160816;
        b=GJq9G68RPO3agm9EEarcKCArS7S/hZomcnRgrsUIRj86EgtLIvLms9d3flOGMWM3tN
         H4eXt3HwhdeiVvkfmsRbIeyVKyCt0kLyVz4Ez02+uCfzXRO8lAvO1FZNIFyfD9TyLHSp
         rGnuOwIrMPv1E8G2w6o3b9NY/JXZ9iB4Dy186nCLuF6YIlASwwZ73DiZaOxhNHJuZlkZ
         UKiuRZBPC7NTZAsTq7+0TW0Kp5qAj9+E4a3tU+aKar9eCHn4fBZBIVVnvVjz/Bic04ko
         ZqqQmWft7qHGcKGwg2gXqr7xcv/DH5ArYOP1V1Ye3CCmtvWryagKOGZzUpAYUTTgVQZY
         VzVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=zmqKwLOLcsRNrNYyTXT57CwemoxNNTvme8zbTGrtEt0=;
        fh=/ftcwOPYeEIhzseC7WF42kR+xVR/IJiWpLC1+A7SOWQ=;
        b=m+1SLv67wvKJCKJZxxs6Cmh/t2FBGn8FULEaegtxm5NpiWeXokHdjM3FSXf4bcEs2m
         s43zlLVYKIoAcgRJQPZgDAgg96DTYGM5t98RuzU1S6Z1vBTBZ6/U5V0rsoogkuwr8JdM
         n9OZx8Y/g/ugeWO87HDyLQhhi3p4nHoCWaawQ/YQQzOXfxZoo6E9lg0l5SHcJkPz0+Uu
         XSXgtfO32VuiXb0ny+D4fYeuypSgdUvnLC0PGGUbVWfziQc4zMbncCoTLuNMgQITFgV5
         t5nPoSda85Gh9UD+mVZv+yk1KoebBE86o/qBYvhzWNQEIXSv5ngPFeg6WlQ0zrMX8nJd
         HA5w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UYzmoh+c;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m4-20020a67fe44000000b004647d230d49si1157243vsr.64.2023.12.11.06.35.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Dec 2023 06:35:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UYzmoh+c;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rChNV-0005Pa-MV; Mon, 11 Dec 2023 09:35:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rChNN-0005M0-Nh
 for qemu-arm@nongnu.org; Mon, 11 Dec 2023 09:35:18 -0500
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rChNJ-0006EO-Kk
 for qemu-arm@nongnu.org; Mon, 11 Dec 2023 09:35:14 -0500
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-54c70c70952so6468584a12.3
 for <qemu-arm@nongnu.org>; Mon, 11 Dec 2023 06:35:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702305312; x=1702910112; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=zmqKwLOLcsRNrNYyTXT57CwemoxNNTvme8zbTGrtEt0=;
 b=UYzmoh+cxhLoWJLwcXKXq9Pj968t55C3y6LbyoP9PC6YYbVuYw3lkquUe6ZMZaZsmh
 gQM/F8gNEf2qUFaZ9HDsbIf50BSgSTe8GXXq2yGH7zFnKnv0ZJpSAUo+WBPviMadRA3G
 fx2rPQWoRa9VBhhAvtVzXuIxEqLk3wDSjw4f5xnjzgbc3Fhfq3eabWWRMzd2p5043v8v
 61q15YE3JJOB4Qgs84pjw/cFnZhyUO6e9SwW8f2gAZIfbb/wTkcDw2ONff7/5avvbzky
 JAqsPnxWRf9OpYCG7lQcPN6o6kW2JUQvD04QItOuLEHWbo92JFhJzKBd1Fydyn84IXrQ
 jtNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702305312; x=1702910112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zmqKwLOLcsRNrNYyTXT57CwemoxNNTvme8zbTGrtEt0=;
 b=GQ9vrICQT66XZX7YtbDPHsICsMk7qHxh9bZXoC4QWhtxm5v0MhuIz7Zg7fFgNXFPtH
 qOdADQ4FfTBgWILzhkOdKYG0YxtJGkC0TyIdYLGocKv/X6jmrNSu1jpvlj12kFQBXKd8
 cjUFF2xW37LEUCocG8U0Pn6j3ZzVeyRqjiDiG3EiOnHHSXBNItr0vl0s2U55xRuIc3Or
 iPxVfRDBwZ9aB6U6eeT8AJte+oxFGvOZp+oKWPGE+yNkRBjxEEhQjvPL+uxRDaubK0Fh
 zVSIlFCGRuTyRpmNeUT/ggn51qDjccmv4pt6hnCNsw9daeP0DCRBHi7kkFwM/9/0qb5Y
 VY6g==
X-Gm-Message-State: AOJu0YxwSMA/8cFLG7jCbaha7JrOKZyqz8zXXnKZikG1GITmPwEKVG09
 MSTr6xvk3SNaSqssvmrXOdPCP/ijqkI9Ac/a3qraQrpyIWECXwRE
X-Received: by 2002:a50:d741:0:b0:54c:4837:7d3a with SMTP id
 i1-20020a50d741000000b0054c48377d3amr1803630edj.121.1702305312219; Mon, 11
 Dec 2023 06:35:12 -0800 (PST)
MIME-Version: 1.0
References: <20231123044219.896776-1-richard.henderson@linaro.org>
In-Reply-To: <20231123044219.896776-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 Dec 2023 14:35:01 +0000
Message-ID: <CAFEAcA9jeoHuM0Bf0mtRB1tWkjGH4maBOrgBZYm-_ZU+yy-mzg@mail.gmail.com>
Subject: Re: [PATCH for-9.0 00/21] target/arm: kvm cleanups
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: WskntA0D1bJA

On Thu, 23 Nov 2023 at 04:43, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This is primarily concerned with merging kvm64.c with kvm.c
> and then unexporting everything that is not required outside.
>

Applied to target-arm.next for 9.0, thanks.

-- PMM
