Received: by 2002:a17:906:bfc6:b0:9a1:fa4e:495e with SMTP id us6csp347571ejb;
        Fri, 8 Sep 2023 04:23:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGg9kACKcQyLstJBacYFBrSMJf7doEf0pwJRdvtC2264GOCUlgL+OrWaNQ28gF9jAqgFzab
X-Received: by 2002:ac8:5bc1:0:b0:412:2d22:2aab with SMTP id b1-20020ac85bc1000000b004122d222aabmr2293331qtb.53.1694172182105;
        Fri, 08 Sep 2023 04:23:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694172182; cv=none;
        d=google.com; s=arc-20160816;
        b=WYNMS7afKHT+kZ/O1AHJ2CRxCTB96Hed4ut624aqLD67GFmT3ebjnHUkzR2LqkYQU9
         vY+SirFbGuAT30ReVU/4FncdpZdNcfmDgGX9nKoMTGDEMg1DpoknSY1//0wQaNmC270w
         Pzq3M+eQxk/isElWRaP/lbLwErsOGr/qkAjqvqkiOxKYaq3AMb4qExFndwRodj/3id9B
         wlRGs/uzN+1T/ZGCpzz5GqEAHyAz2NcI7jglfI3GTvYQ++4yrMN+x1jegcITw6l9B9iI
         TcbRrKd/KmBQO81NEOCnu3oZx4TQMfxU6ZPnmP7of1JCVd2k6eQG6fUaLGz6YkU0hYmY
         mUtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=fZx/41xnQx3UrrNBNxaWrVM+nipc/J4j8tticD5Myes=;
        fh=xrkPdSTzLfgAPR/xILKWCY/2YOP2wIq4k78J4mWio7M=;
        b=Wegzy0xlpvGYNEuVfH35IYe+ryG8YyMwdXqtfV4gT8ADif/j4zE2I7McB0NYRCiWZp
         PvDAj0cf8y65sJV8cYmgO6LcQjQlkgWTJkxM0UCbwcZ3Vbb3ecWt0u/sztP7Oyjvv2ks
         1rgjsiuVIAiWGZsAN1fcU8DBkIgvE5jKrpmEN3bz65Ax28dfMDsmH79gIuy8fWSeRjji
         Uh2YcdwmXxM+D44KeUXhR8IZKNN4bOQs7vjANMBs7/vhJyW70oU/HzSyxyt7KN5daLhj
         nHvuT/y6WP4HFFOjDDO9bJx2TMbkpkxPjHQRdNPi2LPI35Xma4DUdzwgbZ3C5nQcQRa6
         TUpg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=j2cZ0o22;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w20-20020ac87e94000000b004121fd7e15fsi1073714qtj.631.2023.09.08.04.23.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Sep 2023 04:23:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=j2cZ0o22;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qeZZg-0003fl-17; Fri, 08 Sep 2023 07:22:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qeZZd-0003dm-Rq
 for qemu-arm@nongnu.org; Fri, 08 Sep 2023 07:22:53 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qeZZb-0003WP-61
 for qemu-arm@nongnu.org; Fri, 08 Sep 2023 07:22:53 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-401b3ea0656so20102725e9.0
 for <qemu-arm@nongnu.org>; Fri, 08 Sep 2023 04:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694172169; x=1694776969; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fZx/41xnQx3UrrNBNxaWrVM+nipc/J4j8tticD5Myes=;
 b=j2cZ0o22rQdp4mPZo2LjJqtbtZVlcYmWgIJxGRTPRo8OS/IgQsSobtlhcRAYwzau8J
 j/PkjNogPTqkUmAmE8XNaoKKcs3HomhydI5Q9lraRBS99WXOFqhfPPfG8QKvKNrNsq1I
 jJT0DyN9iJFVJAE5ZFJdZ655DLFrF2aei8TW/lf+WK7uH/hIanPJlDcA7NFjzvoge8CP
 oET1C+MtCTARWdH42/zX4Yc/4OtlM+aTLdHPHcx/c9WseU7q47LdAUz86HEnoF1nZdeH
 ZQD53OlTlQXR2JeFG9dyt9HizzycDM9DLkiPCVsWD8viF9mFOum9Vdx0t4X1iX+0gEBN
 CLzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694172169; x=1694776969;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fZx/41xnQx3UrrNBNxaWrVM+nipc/J4j8tticD5Myes=;
 b=VRvhmTZa7vHA2AiN6ycTjIlliBSgms1azJe5K5MxR18+Br6/EV6tBPnzaO+Df1rzic
 IcnNK7oXWzFS84TRpdVu89+1TTrdk2kaYCgMJqls9dfTtiDuZO+4/jmifu50OpODZQth
 aWqe8cN1LdmC7VHcRunpIi/dVo8UWzu8SZ5ufBxXj2eY9VtbbmV1PKNGCZBY5H+/aeoh
 T24mOlv+qmDw5L4MBmzJlI7RBqQG7IRMBesehqOZdpbQfDA4qx4nryGbgItPK6uZux5s
 gDpSe/9xGS2gTF/a+pOvhsylogd2Z/Md3EbrgVqF9aROdVgyxjiHB82lLKY0p4gU/AoG
 72rA==
X-Gm-Message-State: AOJu0YyEZinjQ09+KYEsdHwlGc8ULENj1pi6LpTJaRZxP1lS/qVe9wj0
 R9dKI9yvLp2LjwjRu3Da0WqReA==
X-Received: by 2002:a1c:741a:0:b0:401:b53e:6c57 with SMTP id
 p26-20020a1c741a000000b00401b53e6c57mr2164003wmc.9.1694172169282; 
 Fri, 08 Sep 2023 04:22:49 -0700 (PDT)
Received: from m1x-phil.lan (lfb24-h01-176-173-167-175.dsl.sta.abo.bbox.fr.
 [176.173.167.175]) by smtp.gmail.com with ESMTPSA id
 k9-20020a05600c0b4900b003fe2b081661sm4968607wmr.30.2023.09.08.04.22.45
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 08 Sep 2023 04:22:48 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org, David Hildenbrand <david@redhat.com>,
 Gavin Shan <gshan@redhat.com>
Cc: Chris Wulff <crwulff@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-s390x@nongnu.org,
 Weiwei Li <liweiwei@iscas.ac.cn>, qemu-arm@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Richard Henderson <richard.henderson@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Nicholas Piggin <npiggin@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Greg Kurz <groug@kaod.org>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 qemu-ppc@nongnu.org, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Marek Vasut <marex@denx.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 Michael Rolnik <mrolnik@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-riscv@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
 Bin Meng <bin.meng@windriver.com>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Song Gao <gaosong@loongson.cn>,
 Stafford Horne <shorne@gmail.com>, Yanan Wang <wangyanan55@huawei.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Brian Cain <bcain@quicinc.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Thomas Huth <thuth@redhat.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [PATCH 1/4] target/alpha: Tidy up alpha_cpu_class_by_name()
Date: Fri,  8 Sep 2023 13:22:31 +0200
Message-ID: <20230908112235.75914-2-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230908112235.75914-1-philmd@linaro.org>
References: <20230908112235.75914-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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
X-TUID: zBI/0ggNaUWl

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/alpha/cpu.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/target/alpha/cpu.c b/target/alpha/cpu.c
index 270ae787b1..351ee2e9f2 100644
--- a/target/alpha/cpu.c
+++ b/target/alpha/cpu.c
@@ -142,13 +142,10 @@ static ObjectClass *alpha_cpu_class_by_name(const char *cpu_model)
     typename = g_strdup_printf(ALPHA_CPU_TYPE_NAME("%s"), cpu_model);
     oc = object_class_by_name(typename);
     g_free(typename);
-    if (oc != NULL && object_class_is_abstract(oc)) {
-        oc = NULL;
-    }
 
     /* TODO: remove match everything nonsense */
-    /* Default to ev67; no reason not to emulate insns by default. */
-    if (!oc) {
+    if (!oc || object_class_is_abstract(oc)) {
+        /* Default to ev67; no reason not to emulate insns by default. */
         oc = object_class_by_name(ALPHA_CPU_TYPE_NAME("ev67"));
     }
 
-- 
2.41.0

