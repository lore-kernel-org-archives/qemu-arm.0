Received: by 2002:a17:906:9417:b0:98e:baa:bd63 with SMTP id q23csp193646ejx;
        Sat, 24 Jun 2023 10:41:38 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7/+0hCZeJ9LuL51ymQ2ZYwKPgMWXd61auq2Z5qSPfrvh+Z/Ec/oezaEq2CwF3dY89cbOeE
X-Received: by 2002:a17:90a:7892:b0:259:d0f2:3576 with SMTP id x18-20020a17090a789200b00259d0f23576mr18838705pjk.19.1687628498350;
        Sat, 24 Jun 2023 10:41:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687628498; cv=none;
        d=google.com; s=arc-20160816;
        b=ZT0FHGOVBG1mRdQBLZTiCvXY3E6brAIV3wqk08aejkRHsJDSgRnXyKUNdHos3jd9uf
         U9cyWOdJ8ThdqkOGmT2NTRQK/q4c8VCmy05w2hSy/C8vlDXaDeRJYv9ou+MYApZHFghN
         09f1mQN9k5NbBM1wMYDS3r1J9tehnO4qOBI3QLUoFSFo3y7jnf3smNZXpIYSKjXmOzgQ
         xazJ1ZcGjjc5dL3iqcNxWOhHgzSqvfTETjK5Yirh8NeFOp7TO5U+FMLk9iwjBWOzbPTk
         1DbbsB2yoAMr6MGsaKsJdLb8WsJdZ6zL5hp+LDWIFFWZdqqLkz0dvcXuscajcSQQMkc3
         hvaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=+JIxHWMClVl6mvpALDoBK231PZeNGUQgT3foMweSwl8=;
        fh=dxlO8U8n9FJbkfu3NZ9xTJMkF/Fn5IQj359CkmYw0tg=;
        b=fGHOi77lw/fvNL+CXxsNZJTjr/huXlwXugpCbJwIFs2M3Rd7BlI1F1mA0pkPha2Qqp
         xodkmHXOQUi7GMF1j6lmDWIFVdKjn5D3h30aSt+8DMHnY46N8BgD839Bs71Ks4KbiIgu
         W4QrRMLp8OBjP/h/4DOi0OzmrgFj0NvN6q9OtjUfJEg0ECzIXau/xPZ5nel4zpDoMoJ7
         kkHrDj/I6TkKDgZP53LMpLHdqaYD4wM8LEwi1fDAJCcfljg85XXTUjv+nw7Nl+FFePbb
         pNfSwfzPwySIWzkHpye/omzpbe8ggFtn8uvu3RI1M57VSsJWek4bwAWqrKV/xlFmEcHw
         7tIg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=d9EPiTdM;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from out1.vger.email (out1.vger.email. [2620:137:e000::1:20])
        by mx.google.com with ESMTP id i9-20020a17090a650900b002509d96227esi3992367pjj.173.2023.06.24.10.41.38;
        Sat, 24 Jun 2023 10:41:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) client-ip=2620:137:e000::1:20;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=d9EPiTdM;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233144AbjFXRlh (ORCPT <rfc822;mathieu.poirier@linaro.org>
        + 2 others); Sat, 24 Jun 2023 13:41:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbjFXRlf (ORCPT <rfc822;kvm@vger.kernel.org>);
        Sat, 24 Jun 2023 13:41:35 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 833EE1BCA
        for <kvm@vger.kernel.org>; Sat, 24 Jun 2023 10:41:34 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-313e2fdd186so746314f8f.2
        for <kvm@vger.kernel.org>; Sat, 24 Jun 2023 10:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687628493; x=1690220493;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+JIxHWMClVl6mvpALDoBK231PZeNGUQgT3foMweSwl8=;
        b=d9EPiTdMBS6ezt21TafvsYW1DcHw6rx3bSyGYk02qijZjSVC1xbJv7hrNc8Bln/+KY
         da9/C7KLlpChs5ekpkEMTLt+8/tTn69sMDTvOr77GosenaKuMVoIqanEcBIaB+x8/IYa
         sMX5xiZvQgUwCoIYnw0wLy0I8qTh5UNWS2TKXn7vV66wpwVU6Arg9AwvuzGbtx5f2Fr1
         NS187HJhnsPP5z7lKj2H5zJ9WFDNB74ee+CLe5qo2TrqCpMy25BW2hi6t3sBgrl2wrMY
         3O1uqpNOR6dT7+pTrezI8H96sgMZeN+qygKbA8KQdg//j8BnqU62WE8Pxxa1LGwOWpQ1
         C2DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687628493; x=1690220493;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+JIxHWMClVl6mvpALDoBK231PZeNGUQgT3foMweSwl8=;
        b=UCV35UScNLbYMVZroL/YyEI27cYpeSk4g/aW1zhPQMi/sGXDdvplqLqwBXV0uNA9xc
         txbOXvIx1jvtdHVCDWK0zlW4YdtNEzl3Yjm2YAxtLezddJ+PeDfWbzVW14Xj14TYM/D7
         7uCOzDkfyHx0CCpeTlQjdi4G/cD2axHWTpFVYK2YBEABDIRVUSF4spC81tqogTztNcSD
         M+Wgftvc3dgms0ybPzXBicX9XtXgqCFVN9hjlSlrt8Hkb0TK+NzNOr9BCUznlnPmt9A5
         mtv+13XgWJqw/gbAAV0qjluzOmmMjGL7nPAOXbUHJvz59qkQPDT1t6dG4mgF5DbL9uR5
         WBKw==
X-Gm-Message-State: AC+VfDxogPYK6rvwngrOPigEqA5g3a26zmy1qPltGb2z7rlnxliOQEyN
        /guEvJsfkebiVlMW8OAdbVtOldB5PXDKc4VKZ+8=
X-Received: by 2002:a5d:5344:0:b0:313:df09:ad04 with SMTP id t4-20020a5d5344000000b00313df09ad04mr2110290wrv.57.1687628493050;
        Sat, 24 Jun 2023 10:41:33 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.217.150])
        by smtp.gmail.com with ESMTPSA id z7-20020a5d6407000000b0030fcf3d75c4sm2609804wru.45.2023.06.24.10.41.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 24 Jun 2023 10:41:32 -0700 (PDT)
From:   =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To:     qemu-devel@nongnu.org
Cc:     kvm@vger.kernel.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        Roman Bolshakov <rbolshakov@ddn.com>, qemu-arm@nongnu.org,
        Richard Henderson <richard.henderson@linaro.org>,
        Alexander Graf <agraf@csgraf.de>,
        xen-devel@lists.xenproject.org,
        Sunil Muthuswamy <sunilmut@microsoft.com>,
        Anthony Perard <anthony.perard@citrix.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Yanan Wang <wangyanan55@huawei.com>,
        =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
        Paul Durrant <paul@xen.org>,
        Reinoud Zandijk <reinoud@netbsd.org>,
        Eduardo Habkost <eduardo@habkost.net>,
        Cameron Esfahani <dirty@apple.com>,
        Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v3 01/16] MAINTAINERS: Update Roman Bolshakov email address
Date:   Sat, 24 Jun 2023 19:41:06 +0200
Message-Id: <20230624174121.11508-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230624174121.11508-1-philmd@linaro.org>
References: <20230624174121.11508-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: h9N9JuOLV25o

r.bolshakov@yadro.com is bouncing: Update Roman's email address
using one found somewhere on the Internet; this way he can Ack-by.

(Reorder Taylor's line to keep the section sorted alphabetically).

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 MAINTAINERS | 4 ++--
 .mailmap    | 3 ++-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7f323cd2eb..1da135b0c8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -497,14 +497,14 @@ F: target/arm/hvf/
 
 X86 HVF CPUs
 M: Cameron Esfahani <dirty@apple.com>
-M: Roman Bolshakov <r.bolshakov@yadro.com>
+M: Roman Bolshakov <rbolshakov@ddn.com>
 W: https://wiki.qemu.org/Features/HVF
 S: Maintained
 F: target/i386/hvf/
 
 HVF
 M: Cameron Esfahani <dirty@apple.com>
-M: Roman Bolshakov <r.bolshakov@yadro.com>
+M: Roman Bolshakov <rbolshakov@ddn.com>
 W: https://wiki.qemu.org/Features/HVF
 S: Maintained
 F: accel/hvf/
diff --git a/.mailmap b/.mailmap
index b57da4827e..64ef9f4de6 100644
--- a/.mailmap
+++ b/.mailmap
@@ -76,9 +76,10 @@ Paul Burton <paulburton@kernel.org> <pburton@wavecomp.com>
 Philippe Mathieu-Daudé <philmd@linaro.org> <f4bug@amsat.org>
 Philippe Mathieu-Daudé <philmd@linaro.org> <philmd@redhat.com>
 Philippe Mathieu-Daudé <philmd@linaro.org> <philmd@fungible.com>
+Roman Bolshakov <rbolshakov@ddn.com> <r.bolshakov@yadro.com>
 Stefan Brankovic <stefan.brankovic@syrmia.com> <stefan.brankovic@rt-rk.com.com>
-Yongbok Kim <yongbok.kim@mips.com> <yongbok.kim@imgtec.com>
 Taylor Simpson <ltaylorsimpson@gmail.com> <tsimpson@quicinc.com>
+Yongbok Kim <yongbok.kim@mips.com> <yongbok.kim@imgtec.com>
 
 # Also list preferred name forms where people have changed their
 # git author config, or had utf8/latin1 encoding issues.
-- 
2.38.1
