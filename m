Received: by 2002:a17:906:d8da:b0:98d:c41:35ab with SMTP id re26csp550457ejb;
        Thu, 22 Jun 2023 09:09:19 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5hRk6Cn51ljmHjzjDQQyaANGAFYdhcWzfHuOCH8f7ZN2gZoJVmx2M4MWB7dBMXLKrToU5l
X-Received: by 2002:a92:c08f:0:b0:331:5aec:5a34 with SMTP id h15-20020a92c08f000000b003315aec5a34mr15292005ile.0.1687450159217;
        Thu, 22 Jun 2023 09:09:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687450159; cv=none;
        d=google.com; s=arc-20160816;
        b=Lyd40JpNYUBOQGwEJAhix4ANnyekoxjouFqkT9f0rakz0oXWaFFdURF6rPi8wWT4VL
         yeMzQP6H6PjInAdZQUYKb+yhEAcJWH8MxgdbIFEpnE7+MQcgYjiLQqsI7em51fI4QsP5
         dOGtHxBLIyy8cbjl5J0pEDYFMdMCMLkLnB4AX2SyyDs8ha6wwyawH3ulS4bbLnV/fZor
         dEs/qrK2V6s6MrbNQVyaxQO4pjvrkRY5JSDE42hLQbq/JLZjx8M0aBVud97nNYmlUAyT
         Kk7pn/oleZHT/w3w6osB2Ww91R2x+CBjPorcy97KFjSEFFUQ9v2YGUV65U5I4fLj3cPm
         PfWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=KWWds0uHrElgc22pSSxJ50tOp/lAV9kSI84s7Y2g/GM=;
        b=JwBJhmd7ol8A9fittWeCNXDjQQFrQMGZRkArfCK7h5PegP02h0N77WlJjWRODgVhUs
         BSLlFqiY1iEEmFd7M2HaY5PTz0LUofQ9DCAGFdHh8ZfeT09DLMN+h8324a4JNbABijRx
         j3i3HyeY59pbjG91Xab+x5BxtXEpkE9dgrTSjU4x1V/m+8dJUg3XnbIwjr6rplG2WLWv
         irRyQRsqe7Xd6liEz7LkdKY45MNvA7NUVMZlv+jWRLW38iG13nHbwALWfeKlNyYsWX3W
         CGggHO6BUUY0ZzInqgoZB8BhsFr3B6Tbb7HAuR8i65KUxR9y9A2LzrRlebLNGKVt7nn/
         dScg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EbM780AW;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from out1.vger.email (out1.vger.email. [2620:137:e000::1:20])
        by mx.google.com with ESMTP id v70-20020a638949000000b005443c85156bsi772796pgd.222.2023.06.22.09.09.19;
        Thu, 22 Jun 2023 09:09:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) client-ip=2620:137:e000::1:20;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EbM780AW;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230165AbjFVQJS (ORCPT <rfc822;mathieu.poirier@linaro.org>
        + 2 others); Thu, 22 Jun 2023 12:09:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229813AbjFVQJQ (ORCPT <rfc822;kvm@vger.kernel.org>);
        Thu, 22 Jun 2023 12:09:16 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3045D1BD6
        for <kvm@vger.kernel.org>; Thu, 22 Jun 2023 09:09:12 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-3fa74d06d72so7278675e9.3
        for <kvm@vger.kernel.org>; Thu, 22 Jun 2023 09:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687450150; x=1690042150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KWWds0uHrElgc22pSSxJ50tOp/lAV9kSI84s7Y2g/GM=;
        b=EbM780AWzavorYGjwE/j3EeJGIDw52NMRbKdS1s1/gZWniGA7sDBRZVP2QyfRqO47I
         7X7B7xFYS297uGD3scmvxOmMiYP9OTll3eGFYcIQd4FpE0WW7V3oKBilIjfQT/k+/GPn
         V5BiCj2bgxxHGiIPvjbPJuQdy4VGi6sUnUZ8JyXtmAJEU6CrcXGXcSuxoa+cZFjfMKPW
         ZWhlpEG7XgwDT27Y537Y1ehWshHrG0ia2ToE68LsnrY1dFG/RpCqknDRqgAY2g/hC1Kd
         jf7UQOxMVQuZzQgTtEe05+aD9m+AbSf0u4R9D8Us4q4EE6ZIvJq/tj+t/EKcZaxvsqzH
         qQfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687450150; x=1690042150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KWWds0uHrElgc22pSSxJ50tOp/lAV9kSI84s7Y2g/GM=;
        b=e0FqUAax2R64ltrvimLB5vcEONpMfhgdazpDe4qAN7u188sb6iELlTWb1pZW0+1G8j
         447IUWjC1SM6oxCsrDsEdNnOl6PJXaCD/s+JLuAdt7D9Zruz+3tSEQB4OxDF8Xy7zLog
         Agi/+/DYRPueahQRq99qOeAVUWyvJrh8Eo4PGzrYxbUIPjsKSJ+JHfWQBc+s0hNkctL5
         yS2QYzJC8GCJZ74yJAb7TfAG8tz4FZWzcZ3xIonLepUC8OhFdywtjlx8vdJCVMFnM1WZ
         zXE0OAZncaFuHbQ2PI0zP8lNfzqhOIhqU3BYLH+ozrwQG+mgb8asxem2fis9s88I0lUv
         qpaQ==
X-Gm-Message-State: AC+VfDxLuiSaUEkWZ/zCIHjWufOx2yRJA3GteG1Z/C/jFPcMfhnv1mHj
        eCQRXmoxTAT4bQs390EzeJXDWQ==
X-Received: by 2002:a1c:6a0e:0:b0:3fa:78d1:572 with SMTP id f14-20020a1c6a0e000000b003fa78d10572mr642130wmc.0.1687450150672;
        Thu, 22 Jun 2023 09:09:10 -0700 (PDT)
Received: from localhost.localdomain (230.red-88-28-3.dynamicip.rima-tde.net. [88.28.3.230])
        by smtp.gmail.com with ESMTPSA id n6-20020a05600c294600b003f7e4639aabsm19231418wmd.10.2023.06.22.09.09.05
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 22 Jun 2023 09:09:10 -0700 (PDT)
From:   =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To:     qemu-devel@nongnu.org
Cc:     Reinoud Zandijk <reinoud@netbsd.org>, qemu-arm@nongnu.org,
        kvm@vger.kernel.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Anthony Perard <anthony.perard@citrix.com>,
        Yanan Wang <wangyanan55@huawei.com>,
        =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
        Peter Maydell <peter.maydell@linaro.org>,
        Roman Bolshakov <rbolshakov@ddn.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Paul Durrant <paul@xen.org>,
        Sunil Muthuswamy <sunilmut@microsoft.com>,
        Alexander Graf <agraf@csgraf.de>,
        Richard Henderson <richard.henderson@linaro.org>,
        xen-devel@lists.xenproject.org,
        Eduardo Habkost <eduardo@habkost.net>,
        Cameron Esfahani <dirty@apple.com>
Subject: [PATCH v2 04/16] accel: Fix a leak on Windows HAX
Date:   Thu, 22 Jun 2023 18:08:11 +0200
Message-Id: <20230622160823.71851-5-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230622160823.71851-1-philmd@linaro.org>
References: <20230622160823.71851-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: jOztt8RCUDg+

hThread is only used on the error path in hax_kick_vcpu_thread().

Fixes: b0cb0a66d6 ("Plumb the HAXM-based hardware acceleration support")
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/hax/hax-all.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/i386/hax/hax-all.c b/target/i386/hax/hax-all.c
index 3e5992a63b..a2321a1eff 100644
--- a/target/i386/hax/hax-all.c
+++ b/target/i386/hax/hax-all.c
@@ -205,6 +205,9 @@ int hax_vcpu_destroy(CPUState *cpu)
      */
     hax_close_fd(vcpu->fd);
     hax_global.vm->vcpus[vcpu->vcpu_id] = NULL;
+#ifdef _WIN32
+    CloseHandle(cpu->hThread);
+#endif
     g_free(vcpu);
     return 0;
 }
-- 
2.38.1
