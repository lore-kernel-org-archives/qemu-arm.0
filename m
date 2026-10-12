Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4B3BCA9ED0
	for <qemu-arm@archiver.kernel.org>; Mon, 12 Oct 2026 17:07:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGJT2-0007IC-07; Mon, 12 Oct 2026 13:05:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xGJRS-0005FD-72
 for qemu-arm@nongnu.org; Mon, 12 Oct 2026 13:04:05 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xGJRL-00076m-Re
 for qemu-arm@nongnu.org; Mon, 12 Oct 2026 13:04:01 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-48b001cd92bso1206246f8f.2
 for <qemu-arm@nongnu.org>; Mon, 12 Oct 2026 10:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1791824632; x=1792429432; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=R4RJkr92GUc2ZF3hnVHuHTKb4cA9SH2XyXh8JZQS20s=;
 b=lSaNKwOnw4+iB91w6ZAXZtJGn8QR2JgGaC1p9JoFnxpxZ3BfV3Vb9fgU1ed7oQFxH2
 5FNz8IfbNXPd/qeQNBn0xvDpy5MActRAr9eY78HJ9Uwbme4tcdguwJYmonewwu9tu1mu
 r9D2EcXEQ6FNUprGnwJIj/1lTnvCK2HCVkemWylh3Uf/pl0OM5+lwBJKBloI6TzJYMUH
 /kyytPj0ltwDh8DEwSUFSZMVmfYZ9WLpvyPXGdTK8uxagsh0J4vk5pHCtl+MYyzcM66h
 eX91WLozMIasneApg184V8HQ5Q10Nq8rn2J3qKzcLCz+mD0oAuCd9zMGVbjzkTSG93SD
 I47A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791824632; x=1792429432;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=R4RJkr92GUc2ZF3hnVHuHTKb4cA9SH2XyXh8JZQS20s=;
 b=R2U/gasY2U3yxl2o4yDW2pA7RqQQdeC4Lg6VUqP44yFhCmc9Q9DAWNL0CuvOU+S+O8
 N2bwN/maXVyFZ1vARcqZbzx2LVGLSjCydP3wqHiblvMhkyeNOSO6r1Ahj6j93rCNgDJd
 epHuyJv1+rrNJHk5NcOffenqXhPw9chMQKuWhosrDOn+OQLrGlwxJ/O+7q4Cm9VGo3uy
 BN4rKuugwbGnQuaqoWdjfD3fJaq9nJrGexAIz004BaLiwI433c+X3Xy7iRgsSS4PhX0K
 CsNSL7zZjrsjfkwJ+/11083L9KObyr3rhE0E49XY+q5k2WHG5wX+1aSR0fmTqSODYERo
 SDtg==
X-Forwarded-Encrypted: i=1;
 AKwUvBwhwSfp4qSp87jrBjygfh22y/31H8EjBoB2oJR/czYr5ZMKnKrIgPXi7HCnIKbGJnEolPVuRAHU6A==@nongnu.org
X-Gm-Message-State: AFq9FYLKiRcXxIv1Yd4qIcIcdsVoXWqnFzgTGNa6EMyficRQnN/iGwui
 CMdU92wXIM2PBHltAQVgblu8JymRfEPwznlroyGruKDLtqdgPV+Jp6UiMrFMWDyZm5Q=
X-Gm-Gg: AYBFou3pJRuEjip0nNfRkcX6oDCEY5cmxBT4p6sW3xXUxJZsd0UIFznOwsoSpWlAsnv
 QV2cAlBPM5ZhNGXPEe6ASzJ4HNlRk/21KPfRvwfASXk7HF2IqcKMjQSwPqGyhaqoXClfVc5MjUp
 W6LYfYmCMoLVrkK5eOpmSYFCHjDNoB9HH459iW21Qspm06Sy2lud7gNyhYhuWCO1zYMx8xknRR9
 SqNPC3gbTY9+uGmes1FWJzmd70yL8kt1vcGICYrPfnByfts8PUYE72fS3twz/MxrlDmHemJ6AHw
 g+ePRuUpwTn8GgvBLqwtTvSb/EZky2Y2tSXBBas3hJ11mLB6TRorr/RiW/qVbbuG9/qRjKijRPl
 WQ+G/alg5rg5S/a7cbC0SHLh2E+x1C3C0Gf3zMlW50l/PrQv+51cRmReMLs6jGFGp1OsakSJgvA
 kSsOj4kRMcVac2mVC19oazwNhYEJNRXVHbLmPMswsLI0bLQ7rQrCQ0Km1CnI4ICqWxEqh1eg==
X-Received: by 2002:a05:6000:25f2:b0:488:5d44:6680 with SMTP id
 ffacd0b85a97d-48dbacdc419mr18661992f8f.36.1791824630538; 
 Mon, 12 Oct 2026 10:03:50 -0700 (PDT)
Received: from draig.lan ([185.124.0.156]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48de0967c03sm476208f8f.6.2026.10.12.10.03.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2026 10:03:33 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 398B55F9CC;
 Mon, 12 Oct 2026 18:03:31 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Zhao Liu <zhao1.liu@intel.com>, Kyle Evans <kevans@freebsd.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Brad Smith <brad@comstyle.com>, Ani Sinha <anisinha@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Thomas Huth <th.huth+qemu@posteo.eu>, Keith Busch <kbusch@kernel.org>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 John Snow <jsnow@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Anders Roxell <anders.roxell@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Warner Losh <imp@bsdimp.com>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Yoshinori Sato <yoshinori.sato@nifty.com>, Peter Xu <peterx@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Song Gao <gaosong@loongson.cn>,
 qemu-s390x@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Max Filippov <jcmvbkbc@gmail.com>
Subject: [PATCH v2 02/16] tests/tcg: fix buffer overflow in
 multiarch/linux/linux-sigrtminmax
Date: Mon, 12 Oct 2026 18:03:16 +0100
Message-ID: <20261012170330.1144446-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261012170330.1144446-1-alex.bennee@linaro.org>
References: <20261012170330.1144446-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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

From: Max Filippov <jcmvbkbc@gmail.com>

Fix new_argv allocation size to be `(argc + 2) * sizeof(char *)` bytes,
which matches the way it's used to store `argc + 2` pointers.

This fixes the test for me, which otherwise fails on xtensa with the
following message

  linux-sigrtminmax.c: 59: main: Assertion `execve(new_argv[0], new_argv, environ) == 0' failed.'.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Fixes: 6f58b090328 ("tests/tcg: Add SIGRTMIN/SIGRTMAX test")
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>
Message-ID: <20260708150541.2137546-1-jcmvbkbc@gmail.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-ID: <20260930164649.433573-4-alex.bennee@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/tcg/multiarch/linux/linux-sigrtminmax.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/tcg/multiarch/linux/linux-sigrtminmax.c b/tests/tcg/multiarch/linux/linux-sigrtminmax.c
index a7059aacd9c..b5ea65f3d39 100644
--- a/tests/tcg/multiarch/linux/linux-sigrtminmax.c
+++ b/tests/tcg/multiarch/linux/linux-sigrtminmax.c
@@ -39,7 +39,7 @@ int main(int argc, char **argv)
     assert(qemu);
 
     if (!getenv("QEMU_RTSIG_MAP")) {
-        char **new_argv = malloc((argc + 2) + sizeof(char *));
+        char **new_argv = malloc((argc + 2) * sizeof(char *));
         int tsig1, hsig1, count1, tsig2, hsig2, count2;
         char rt_sigmap[64];
 
-- 
2.47.3


