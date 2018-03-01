Received: by 10.28.91.67 with SMTP id p64csp1869627wmb;
        Thu, 1 Mar 2018 06:06:17 -0800 (PST)
X-Google-Smtp-Source: AG47ELutZFIAUaUyDzjcVAGHaNCSlDpKgUIajw2OlSXDTGJSy7ZqZ19fJuRWeIFEjibpMrtbZSuO
X-Received: by 2002:a25:703:: with SMTP id 3-v6mr1149154ybh.513.1519913177348;
        Thu, 01 Mar 2018 06:06:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519913177; cv=none;
        d=google.com; s=arc-20160816;
        b=LiRt3me9IsZbebzQp6aWd9cPaSZp0g2hS5Ji8fhP1vVIVIz9NLNjAQ0fLaQg5xj6sq
         FMrOOuS8NfjllzHOYIYWNUFnpaUWJS5Q9MUL5HtxoY6pLAXGxJzs8B2g+rQssTXysiuj
         oYMgXdbuohYExebXK4JWfnHAbQg/dUIehVtPoeDAz+CaKlPpl8hNO5inGB59JBM7gH/B
         LZxkad7vul2cfX8rIXBGYkj4WfleoIq4WueYmOsHDxAkniqXXTt+MqwHHA6d6ojn80mb
         oqT8ECo5df38AOlY4m69fZXHYoRsDnJOZCptka359OLa0SqeBvgn4CCjOQQ8zx0rHOdT
         6rPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=rv3YuizoNZaibTmuKvjgXapnc7TQKV/43DzGCq9NOxU=;
        b=v9/KzyRtUpbIeQqfmru864/90FzbBSzAz9xAr9R6T7z/SJnSV53nXN9zsoyF7CQoR8
         T3mWRAQevuSwbSvnEu7gUT4v9zkknIaeDifs7hEzo4XACzpvom68jkMOWfFWL9xBlaaf
         ABTLoSkqBZAFMNjUicc03kSQjVt7KGvjwXJ8pBx5wfZFbNAXof3g8yGobwLdlQ3PE1RZ
         abrZmwjmLWDwkOYF+ZyWdXM1vszXD/k/Q23ZjWXC7MxxpNbjdqNXLGm0dEx0gF3cDGfl
         UoJft3wNCcY8DLuxlQm44Jckkv2n4oWFfDlxMpBMUETfqxmtUHuITyEB3Hpo1gstSZw8
         wTiw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=R63Tdpj+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a72si653000ywh.560.2018.03.01.06.06.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 01 Mar 2018 06:06:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=R63Tdpj+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57049 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1erOqe-000057-Rr
	for alex.bennee@linaro.org; Thu, 01 Mar 2018 09:06:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53742)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1erOqR-0008U0-Uw
	for qemu-arm@nongnu.org; Thu, 01 Mar 2018 09:06:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1erOqR-0001xk-26
	for qemu-arm@nongnu.org; Thu, 01 Mar 2018 09:06:03 -0500
Received: from mail-ot0-x242.google.com ([2607:f8b0:4003:c0f::242]:35666)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1erOqQ-0001xU-SX
	for qemu-arm@nongnu.org; Thu, 01 Mar 2018 09:06:02 -0500
Received: by mail-ot0-x242.google.com with SMTP id w2so5644178otg.2
	for <qemu-arm@nongnu.org>; Thu, 01 Mar 2018 06:06:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=rv3YuizoNZaibTmuKvjgXapnc7TQKV/43DzGCq9NOxU=;
	b=R63Tdpj+2nL4w9Bne7fKJh4dJNljhL5qSd9ByqwEqOjD+eSEk4XS9s4LAGuP4GzfRm
	W8dx6W2TxC4uyi7zHQcjSpVuxh41KCO77kuZ5aNKSEzAz1PwqEMnfRTH2JONTWCiKdnk
	PFti/Uu5MAGLQbQX9GgUgylE+6bhrJikE0Nek=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=rv3YuizoNZaibTmuKvjgXapnc7TQKV/43DzGCq9NOxU=;
	b=r8/szf48ijnAVe4IGpZ8v9NjyRx3ijIaLYGcfN7fFGayIKlcLVn6ppNl7FPy2VTHp6
	wtb1/6SGzU5kc7XGi5nWN4dhqTOkvM9BM/aINRZWWOu8fOAPVgQ+8ADRWpBT5oQNRHkg
	PUgrcSZRFZszxBVL2MFiFymmC7HTG1UgHsYu93iTx4gslckg9A6RfLtR+KDbq69vn3uC
	jYQH5UnuSk1Kufd7lnDOE5Aqls4xBa98yf4ekTFj0YrIQ1+OfDvKpTzYYWeBRqmlS92l
	FN3oSrcijZg8L+sQzNW6uMtWm5DBqdaNrm3EvtheEpBS+eS8IVxMDm6HmXa1+tFrX+cc
	vM+Q==
X-Gm-Message-State: AElRT7GImHAGorGmLHnuc+fzW19Itp96BMvHyeT6Hom1Vu/wK1r7ATZB
	jw9p4xc+1cbiZL4kJSHzhYPTCOz0aB4mO9DkKY0/pQ==
X-Received: by 10.157.3.70 with SMTP id 64mr1341850otv.258.1519913162149; Thu,
	01 Mar 2018 06:06:02 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.33.100 with HTTP; Thu, 1 Mar 2018 06:05:41 -0800 (PST)
In-Reply-To: <20180228193125.20577-15-richard.henderson@linaro.org>
References: <20180228193125.20577-1-richard.henderson@linaro.org>
	<20180228193125.20577-15-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 1 Mar 2018 14:05:41 +0000
Message-ID: <CAFEAcA9mVyHS2_2AoLztLFSFtZnQOMQBfsQkAs=zO6adeZBoZw@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::242
Subject: Re: [Qemu-arm] [PATCH v3 14/16] target/arm: Decode aa32 armv8.3
 2-reg-index
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wlgYCVrpdGFn

On 28 February 2018 at 19:31, Richard Henderson
<richard.henderson@linaro.org> wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 61 ++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 61 insertions(+)
>

> @@ -8492,6 +8547,12 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
>                  goto illegal_op;
>              }
>              return;
> +        } else if ((insn & 0x0f000a00) == 0x0e000800
> +                   && arm_dc_feature(s, ARM_FEATURE_V8)) {
> +            if (disas_neon_insn_2reg_scalar_ext(s, insn)) {
> +                goto illegal_op;
> +            }
> +            return;
>          } else if ((insn & 0x0fe00000) == 0x0c400000) {
>              /* Coprocessor double register transfer.  */
>              ARCH(5TE);

Missing the similar code for disas_thumb2_insn() again.

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
