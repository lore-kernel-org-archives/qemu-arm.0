Received: by 2002:a17:906:bfc6:b0:9a1:fa4e:495e with SMTP id us6csp373716ejb;
        Fri, 8 Sep 2023 05:11:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGQwfjWC/Wy4C+FaphCAMzccwz1NSOt7S9nyAIX++hec00eIO7MhqPzcgG/QDgJa29T5Wd3
X-Received: by 2002:a05:620a:2ade:b0:76c:8d5f:5954 with SMTP id bn30-20020a05620a2ade00b0076c8d5f5954mr2154330qkb.70.1694175061107;
        Fri, 08 Sep 2023 05:11:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694175061; cv=none;
        d=google.com; s=arc-20160816;
        b=lKhgznOlL4ch4cblu5qHO1wtairHQzyIjaDFOp9Swoy5CT8yQ7d7RF7h1BEoRVYzcb
         aA0ErGad0bQnL9tyPNobfGg/1ELETwgwzO6aEN+iMekLqIcd7oCsYW3ePF+/oZcGwybS
         UVSU5Ktm3ye6rofzq9z5undMylTI1iWjwjJ/LympU9dsYevjQiXF7/L11u7PXLRt8eqc
         B1/WojREH4KeGwQgRvf9G3mnqDNWbPH9I6vfEM/dVkirgmq7he8ybyTryknP1RSlOQMs
         /qd6U568poQrUrQuSRvYXt+I8AYp6kuRaZRXnxLaNieF5FzqSLktyf3UX2vg6BwSw+pI
         EAYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=39oDq1SHkVWT6dfZk/dMADTgX3KEW+aeBSn7Fn7ylqs=;
        fh=/ftcwOPYeEIhzseC7WF42kR+xVR/IJiWpLC1+A7SOWQ=;
        b=WWpDgvCNTYDfE4Z7dp3zuhOLJbfw0101ZgfXoEFyBodiW/q9PM4WmUPZzsIN0ZwWvW
         WbD1yRN43MDwi1VL4EHzg72DN2RBkGJeu2FgR/LMJrYNyffg+xUDvD1gLr6x07wQ1+sl
         XlO5eOCqexLbVFkviRv6shSUGQcxiWYrNiyV6qJ4PiD29gCzDme4lGFi0b7jD4QR91JN
         rzLcOnF2w+dnMR9fWcHWlcvVb+u5TZ58I+G1b2IMO62jgXFfOyfgqXmrMelQQAk6r9Ng
         ao5jWmn2R67IMHEtqw6cHWbDfB1AlPf6OWioHGzBLl2wn/8GLT+GhHp+TtkPA+lvAKgF
         COCw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AfgaTSwT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bj21-20020a05620a191500b0076841128d10si1018579qkb.533.2023.09.08.05.11.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Sep 2023 05:11:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AfgaTSwT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qeaK2-0001rx-5U; Fri, 08 Sep 2023 08:10:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qeaJj-0001Rs-VI
 for qemu-arm@nongnu.org; Fri, 08 Sep 2023 08:10:37 -0400
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qeaJf-00034B-H9
 for qemu-arm@nongnu.org; Fri, 08 Sep 2023 08:10:31 -0400
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-5008d16cc36so3369855e87.2
 for <qemu-arm@nongnu.org>; Fri, 08 Sep 2023 05:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694175023; x=1694779823; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=39oDq1SHkVWT6dfZk/dMADTgX3KEW+aeBSn7Fn7ylqs=;
 b=AfgaTSwTDb+7oegrJ4uRlR/dRWWz6jutaG38ozIyGvcx0WrmxpxomAhRqq7IiJQ2Z6
 ScXJg0oiyc1vQHE1sjeiAqmC9IpgzC5u0/CMHDwsmrAKtiFMYQy5r8dVBItQ15/tZMiU
 OqIbIyH9FcOcxocDlLYwvLXWSMXOJ5+AbGVDey6BqpADD6PyjJ3Obdg50TmYhgsEoG42
 eWOTmS26sSSRShgurIr6W7WiBLRhYSRJvvkEdpGF8mscWVEdsoKHtDwX/eXbyzaax020
 sXCTXGefHjgVY/RTdA3ukMyE/3aSLX5xrUIYmM+C2TFP32nWLL3T8yTKJenSlV7yXhfI
 J82Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694175023; x=1694779823;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=39oDq1SHkVWT6dfZk/dMADTgX3KEW+aeBSn7Fn7ylqs=;
 b=hu16UEZ/mq53+WJxwR9Dr5zj3suJWuvN9OzpbCE+NdbXPf9lfZyLuPbqud/IOLyaiQ
 D+PzOgqmfPNOtrZ4C5evt0hfXdANQFBy3arvIMOotzzZeyx4olcvs9KMprJf3XEUqDmy
 drzLCSAWcnlKb65xIg7dJUlPrXdSjSTWV27cpv9teh0Gmj7we6O2ZiULXazv/seZ0uE4
 6A9x2+FpLU6LL63vADq38E+WTSwdET941TKXFl3BkLroyIRPSrfRKKWX+8KuTgpJhv9d
 mEb+SMx1ylLdVOeEEHC6yxSxCrCVFR11N5vFD3Ed7D/6nJk/6OJ/dKnzsan0XZeN8EQX
 oQQg==
X-Gm-Message-State: AOJu0Yx9kD7ohV5ny4bjJKBRkjTsi5pkOlcXs1IG4VBJMiGacJXPg19A
 fIqbd8/euFtsVxRdL9eB62PTgGTyaHCSNpI4VNgqbA==
X-Received: by 2002:a19:e057:0:b0:4f8:6d53:a68f with SMTP id
 g23-20020a19e057000000b004f86d53a68fmr1589444lfj.64.1694175023429; Fri, 08
 Sep 2023 05:10:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230901203103.136408-1-richard.henderson@linaro.org>
In-Reply-To: <20230901203103.136408-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 8 Sep 2023 13:10:12 +0100
Message-ID: <CAFEAcA8bjNKqd00cUs6mc+WDfizABRE75YGCFri7wTfQrPdCXQ@mail.gmail.com>
Subject: Re: [PATCH v2] target/arm: Do not use gen_mte_checkN in trans_STGP
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::136;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x136.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: AjRXpytxYR05

On Fri, 1 Sept 2023 at 21:31, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> STGP writes to tag memory, it does not check it.
> This happened to work because we wrote tag memory first
> so that the check always succeeded.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>



Applied to target-arm.next, thanks.

-- PMM
