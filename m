Received: by 2002:a17:906:bc5b:b0:a47:c39e:cbe with SMTP id s27csp3989507ejv;
        Tue, 2 Apr 2024 07:25:40 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWIn549557PcXt0/Adpe+WvfXR/4gm5M4rrfTH0PBiQgule5i0jJtDdNmH2ZqB9aeF1R3yE7/MCtinalJOoipuknm1yZbkN
X-Google-Smtp-Source: AGHT+IENJBv5NBNcN3pSCvRRf6APEM6MnNXwzihpKFVwbVSJH/mBX53VcjgeX+voDxGr/UlWtD74
X-Received: by 2002:ac8:7dcc:0:b0:431:32c1:e8b5 with SMTP id c12-20020ac87dcc000000b0043132c1e8b5mr15170297qte.50.1712067940395;
        Tue, 02 Apr 2024 07:25:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712067940; cv=none;
        d=google.com; s=arc-20160816;
        b=Ffg/APNkHIGTkgBCoBDvIzTRg22f+niAvTaBXyZClSCkHUAnQNTexuBOEWSmKhQRx9
         rP5IpKy9CIwZKyyXiCD2qJFci/YW0OiUtsj5JoPqgwdQjAuHBFCTEY1yP5q57da9dPLb
         BxZPjb4WhE2oBZmQdAKLl0PuY4KjGWtmSA+KwoOJ0EtaJJLshq/XVNsrY/fiSq42x084
         kJgyZaNp4FEzzdJTbFsbP9Ru4PiMqULvrg+CyqkQjfSes6Sw6UxkY4N8dgu4w0juXWFA
         aOPINasUul/OEp3UlVcXstiVs0BYB5dj2IeHZ5WVotD0oS8SMtJAY356NFiP3m+D6noa
         NgjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=uQbqgStHmRhecsY4PYqLfYr9cNfbGSMKT9lGuv09ipA=;
        fh=6U6ql6D0ajCW6I9sjJhDXIQlnaQakd3Y0rFA9Yu2tlQ=;
        b=VwTdh7o7O1up4q8yQhUqSHU5o4f1iMG3fhMieQ7CmwfHth8qxqGBwlOq1N8tMUNZ2S
         cErHHC+W3DNj9+i+V3YHeNbW3a0/9QY4NbhyecLNh+/BC3NZKuQNCCJ5f5gHJWVBI/dt
         Onw6JDM7TjUcA8ZklNKf/N38fpEgEj3mlqnTO8wQbR+AVrHo54mLsJDwsvIx5gFav3/P
         zgJoGc0gBvote0HkJpNw8o1BC2/X84hwTCRDvpPdLbtiJ74mHC5fxcRyWANMHqWmerAL
         9NIAG8+iKULSqij8mN78znLoNXPtPHPK+tce05Fwt/Pek1n7kQHdghymhWXd1GBoulFc
         wTcA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PneklPK3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 7-20020ac85907000000b004311dc257ecsi11793128qty.635.2024.04.02.07.25.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Apr 2024 07:25:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PneklPK3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rrf4d-0000vB-6k; Tue, 02 Apr 2024 10:25:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rrf4a-0000tp-Fs
 for qemu-arm@nongnu.org; Tue, 02 Apr 2024 10:25:12 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rrf4Y-0007yi-JH
 for qemu-arm@nongnu.org; Tue, 02 Apr 2024 10:25:12 -0400
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3436b096690so511353f8f.1
 for <qemu-arm@nongnu.org>; Tue, 02 Apr 2024 07:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712067909; x=1712672709; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uQbqgStHmRhecsY4PYqLfYr9cNfbGSMKT9lGuv09ipA=;
 b=PneklPK3VWzq7Rpn5MJMwrcOmZ+1kZlnIIZfc+UQ6NsFTudEX/wZu+9IcIIeFsc4Ef
 oRer9N1Y2vi2RSUgioIWehUSUb4Hg276okTDBY8R25IhjroBe2gx2rdl9ps5ea5oahdN
 iovT3uf6a18kuyIieZKCzeHwnW7dBNMns2VWDPOUt27srLXMgkH6UABqxVENPh3k3K8p
 D+BM8KEuLSFNaBpclbzdqvoIDyzXPde86eZjyiJhQ48a1aBaVW0j8DJ9HZzOG3ZqE4e8
 3eS0eJpKGLK94BVWnYnU9m1XEA7Xzpno6r7WrK4WbzeocHAmtUiWelYzuItG1FpUwDVt
 eBRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712067909; x=1712672709;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uQbqgStHmRhecsY4PYqLfYr9cNfbGSMKT9lGuv09ipA=;
 b=hGpW2gfTWckHbszIworUIvVksBpjtHiJsIsje1UgKlGo/VaX0/NDw2pdWOLiCxd9xV
 F7Xvta4wjslcZzjuge40PMdQQpLrcgATg6DQ3RzLxEDNJFfY+pExV7m4dRba3vAby8EE
 aZekz8RAWIv5dZRTERaEfgXzlF2HHpbOB6TVZ5J2ACe94vfdf8Hk7PEet+anTRSTtR9f
 /akXGNhDbw/r9srHk9DX4FlR/LGVuC8P7J0OAVaxPQIz7Qy65CSJdEYEej92f8bWaSJc
 RFnOGWwgYo1xvADWP9g0xW45UM+amAL2lR344EpAIov2RfwYhx0EF/A87EtmdLnfli4x
 Z5KA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVSq26NWgJfKBYFqJqK7Yfu6SgMvRj10FmIom30DRoQKh5xK4Bxp3scvnf9rE17a3g+ZHANWNVVO/DlRN9DGmAZVh1q
X-Gm-Message-State: AOJu0YyV+lyNy6qfmH80+H0sWJ+2vvjeWG0Yj5etqs2KPseK6yEnrK61
 +91eDRGz7jRgKTqyjTtvrL/wvttQQhSlBPN4A/uMHAeG5MzOEY7n5tBOsAbbWlM=
X-Received: by 2002:a5d:56cb:0:b0:343:8022:dd08 with SMTP id
 m11-20020a5d56cb000000b003438022dd08mr327218wrw.0.1712067908944; 
 Tue, 02 Apr 2024 07:25:08 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.202.91])
 by smtp.gmail.com with ESMTPSA id
 bx26-20020a5d5b1a000000b0034356c434d0sm2796273wrb.117.2024.04.02.07.25.07
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 02 Apr 2024 07:25:08 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-block@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eric Auger <eric.auger@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 05/15] hw/arm/smmu: Avoid using inlined functions with external
 linkage again
Date: Tue,  2 Apr 2024 16:24:20 +0200
Message-ID: <20240402142431.70700-6-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240402142431.70700-1-philmd@linaro.org>
References: <20240402142431.70700-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: sf5MFUts9vyI

Similarly to commit 9de9fa5cf2 ("hw/arm/smmu-common: Avoid using
inlined functions with external linkage"):

  None of our code base require / use inlined functions with external
  linkage. Some places use internal inlining in the hot path. These
  two functions are certainly not in any hot path and don't justify
  any inlining, so these are likely oversights rather than intentional.

Fix:

  C compiler for the host machine: clang (clang 15.0.0 "Apple clang version 15.0.0 (clang-1500.3.9.4)")
  ...
  hw/arm/smmu-common.c:203:43: error: static function 'smmu_hash_remove_by_vmid' is
  used in an inline function with external linkage [-Werror,-Wstatic-in-inline]
      g_hash_table_foreach_remove(s->iotlb, smmu_hash_remove_by_vmid, &vmid);
                                            ^
  include/hw/arm/smmu-common.h:197:1: note: use 'static' to give inline function 'smmu_iotlb_inv_vmid' internal linkage
  void smmu_iotlb_inv_vmid(SMMUState *s, uint16_t vmid);
  ^
  static
  hw/arm/smmu-common.c:139:17: note: 'smmu_hash_remove_by_vmid' declared here
  static gboolean smmu_hash_remove_by_vmid(gpointer key, gpointer value,
                ^

Fixes: ccc3ee3871 ("hw/arm/smmuv3: Add CMDs related to stage-2")
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Message-Id: <20240313184954.42513-2-philmd@linaro.org>
---
 hw/arm/smmu-common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
index 4caedb4998..c4b540656c 100644
--- a/hw/arm/smmu-common.c
+++ b/hw/arm/smmu-common.c
@@ -197,7 +197,7 @@ void smmu_iotlb_inv_asid(SMMUState *s, uint16_t asid)
     g_hash_table_foreach_remove(s->iotlb, smmu_hash_remove_by_asid, &asid);
 }
 
-inline void smmu_iotlb_inv_vmid(SMMUState *s, uint16_t vmid)
+void smmu_iotlb_inv_vmid(SMMUState *s, uint16_t vmid)
 {
     trace_smmu_iotlb_inv_vmid(vmid);
     g_hash_table_foreach_remove(s->iotlb, smmu_hash_remove_by_vmid, &vmid);
-- 
2.41.0

