Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp480369ejb;
        Fri, 7 Apr 2023 11:52:32 -0700 (PDT)
X-Google-Smtp-Source: AKy350Y4vmZ39L4NGCOaMAwtok2NW1sFx03ddVS5TBN/PJqJr+I2DRWXA0XPrrMKzJSCDtsr++m/
X-Received: by 2002:a05:622a:5c9:b0:3e4:488c:9325 with SMTP id d9-20020a05622a05c900b003e4488c9325mr5868496qtb.15.1680893551902;
        Fri, 07 Apr 2023 11:52:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680893551; cv=none;
        d=google.com; s=arc-20160816;
        b=RyX24S3z3TJMAuFykE58qWag5F9Sj/nrHu6S25fMU7xK5OqVmqMHjNcTruyUrmHmN/
         fm63wIDJUq13GbCE6VC+pNA9o5gdySyeV6kv/yaj4QfGevs5Vr5UB/Yw4v3AzDOwsDnq
         L9UYOkkSMYioSQwhZdkQ85uX9lzK+jj/m9o7BaRvJB+tOOcHPl1DnJ32/REAopWIgSpz
         Jxd5HTNKczaYaKaPl5NrqRHbSySwrdA7tqTskAzAJE220nRZTX4wDEoocbOiHxACsRX/
         usfcnj9Uf0WhyW2AAArF1Jc8ygzSZnP0B1xvxQgLr8rlHxySCY5brQqHoZDg/Cx1zVyp
         a1Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=ctvi0OiUA+9muAeMdyeGMqilYQVzWS8HEQhZJMbM06g=;
        b=uepuSgChlmrpCnYjkMHCRke1qeB68wq1++zV4V7+tuqREmAmcL8IteI20BfYLCUzFh
         v5uvNebWhwyHQ+5QSf/oLMApjbCDqG6OfNzVOrsG0Xn/axSKsfG+ep0t4R1+Y6W8+XfH
         43zKGSKz9tS8N1EOrTDec9+QYrSoUhloFFhwgUScUE9qnzsRTmH9j0fdDUmdy7SVwG9n
         y4vGHDUt5Ehp3/id2fxL0q2uhHradF5V43EAV/VZmoYIyx/EESqzZWkElgAkEMNX8GUA
         omh033f993NuAVe5SWti80g4CSK1vv8eaO9cTeLQpn3T+iDOLsMRd4ILBuxR02Gz+5ZD
         e+sg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xQjopHrg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k19-20020ac85fd3000000b003e4ebb82e43si3136345qta.496.2023.04.07.11.52.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Apr 2023 11:52:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xQjopHrg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pkrBn-00054E-O5; Fri, 07 Apr 2023 14:51:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkrBk-000528-Eg
 for qemu-arm@nongnu.org; Fri, 07 Apr 2023 14:51:56 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkrBh-000870-FV
 for qemu-arm@nongnu.org; Fri, 07 Apr 2023 14:51:56 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 b5-20020a17090a6e0500b0023f32869993so2145173pjk.1
 for <qemu-arm@nongnu.org>; Fri, 07 Apr 2023 11:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680893510;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ctvi0OiUA+9muAeMdyeGMqilYQVzWS8HEQhZJMbM06g=;
 b=xQjopHrgV5HZa4kw7VDbwmgRPOgbPebpzrbDR287+B99ohLZ1A5XGwaxLPQNm+sobS
 fNKTF1MINKBOX2org0Vk86kGfKmX9xKE2RJtS0HEr4cN7HlHBNDzFaiySGpiv1GK++OU
 fMPgHr0F3kkG2BdqXR53dG44vf6Eg5dsK6VCgd1o2wWvoRpKhM05B2P8uigVp5FUZrJF
 fpxdAa7WHN2NdKalQmlmzR1+RkZ+bKSZoPcZAnBnZe+FKpa5HzQ32F5/vyyXO9CtpnH5
 ortPtmgiLMykJ5k6agXGpT77p37/OWcRrSvZZEkJ1TuLEHGZhqAniHwiZIjKmuVZ4AyX
 UPNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680893510;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ctvi0OiUA+9muAeMdyeGMqilYQVzWS8HEQhZJMbM06g=;
 b=pyqoj4asRlWdX+F33C64p+82Wz412t+NopGxuqWYRzpgySFjzCykeqlBYAoJ7Rpaye
 2Ff53rz3Y6D7vJF5y+h5bcw2wvDkvEGJbYJK9h8OzMIEvOzCdU278FSzw83+AUFKgxdW
 JoCEHDTYCD4xNDqOqb7PpOQsYuBuNZ+tVExTsduqP/kNqun4+QwW5MIkPa1l9SrwpLSS
 QS7eu7kBnoe2fn9d65Js8IYb4prMyHMg367bUEl72cm7viPN6GACzq+OW2t+XOsHDNLB
 5ojCDz0DV6oo8ni38xUG9t46REt8oR9x3OlqXuo244ga6Y4KS6kDDENHHt6BHNi2Udvu
 IPow==
X-Gm-Message-State: AAQBX9dcK5wr6dl2+cupPhbH6kik70UPWmfoafvuZC0Hssl1q7Z0c711
 DOpEM8X5EymijL7TDar6TtfnhAAJ5Wsr5WijMmc=
X-Received: by 2002:a17:90a:1952:b0:23d:31c3:c98d with SMTP id
 18-20020a17090a195200b0023d31c3c98dmr3552561pjh.15.1680893510219; 
 Fri, 07 Apr 2023 11:51:50 -0700 (PDT)
Received: from stoup.. ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 v4-20020a1709028d8400b0019c13d032d8sm3205796plo.253.2023.04.07.11.51.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 11:51:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH for-8.0? 0/2] target/arm: BTI guarded bit fixes
Date: Fri,  7 Apr 2023 11:51:47 -0700
Message-Id: <20230407185149.3253946-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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
X-TUID: UD9wBYSocPhX

As reported by Coverity and triaged by Peter.


r~

Richard Henderson (2):
  target/arm: PTE bit GP only applies to stage1
  target/arm: Copy guarded bit in combine_cacheattrs

 target/arm/ptw.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

-- 
2.34.1

