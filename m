Received: by 2002:a17:504:c7cb:b0:1be7:c013:c773 with SMTP id cj11csp309848njb;
        Thu, 27 Jun 2024 09:24:37 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXkS5noh242pB3Hcmy/ZpXYVsULl5J0948/YD9wqcTHtceRlUjXPw+MwANaPAxPM7YwuBl+6aUPoLc4ZxYO6GJvhI9RXzzH
X-Google-Smtp-Source: AGHT+IFaQVQqjPE/BpuPzySkytwguo3Zjz8CFG4EDU5p9O4HjnXQeA7WWJSbFMZqX7N3ZYQaWLzK
X-Received: by 2002:a05:6214:29e1:b0:6b5:1f3e:a92c with SMTP id 6a1803df08f44-6b540bf2385mr182426256d6.58.1719505477794;
        Thu, 27 Jun 2024 09:24:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719505477; cv=none;
        d=google.com; s=arc-20160816;
        b=Mgjd2KowfEmD5hwi9/ji4IU4A+05uK3EJWHUml0silRedeLcSTq5yZ6mYC++tF+s59
         evSbghapQPLPdljd2ThNapWBE8BiyTg/Hgl8NhDSsCVMZL7zAwcvBXDcC6ZREQ70z0kL
         Bsq0CW2pSJfTt4b/2iPWj93BjFgpudDVPCIeXNEr//Sq/CD1E6gdQ3L9J0N3CRFuyCsH
         MKSej5dyvKiBAP46VdtKzmmFTWyeyawLoEmaGMDuKQMBftakcdMqKboSl3h+LZ0vfahy
         5mCaAVHc5iJJw74qQqk4HxhB35NnBKs/9URl8LAa4HMF+6JdG0IvE5kU8+jtfhMFJTE7
         NyfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=+otp2F30HYnVaW0wjGWSRpaE6+qcbVlZ832snl2PQg0=;
        fh=wq/AhgrnPOXb+SZFZ5fwCsiayW5CCBdemZGj66HkkMk=;
        b=vgguQkMshKifT0Ay4HlAFfLGSLDt8/VW5vKee0jNhuDtBRbIEEvcbpl+PCZmTRy2Ts
         YEH5qkowA6SSjZ6MQsxR3bKMn4H9FKUKoZdykUPwgPteZ04HW6l0LdRK7Xh8L0Izk2Qw
         E0MeVlpu0UxO4FaEtMXZVPI3H70qwGwwxDDjkuHDbEQ5YGfLpjBeKX+E/zAZCcLLqNe5
         YMdUhvTxRcn+nnYoGHHoXxqZT7VMxpPGOfTB9ZAGF9ZegU9+UoOUiogyTmwNOZoZkO3A
         SSxT3lX7V02bT/g6mnbA5WVJxcmm6rEurB/eCizZnDQDYZaplrvVYoZCxax1QjxjtI6k
         JBpQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tvg83VxA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b5926fde2bsi15846966d6.509.2024.06.27.09.24.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Jun 2024 09:24:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tvg83VxA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sMrvA-0006Pd-6g; Thu, 27 Jun 2024 12:24:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sMrv4-0005v5-NF
 for qemu-arm@nongnu.org; Thu, 27 Jun 2024 12:24:24 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sMrv0-0000K6-Du
 for qemu-arm@nongnu.org; Thu, 27 Jun 2024 12:24:22 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-424acfff613so25430695e9.0
 for <qemu-arm@nongnu.org>; Thu, 27 Jun 2024 09:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719505454; x=1720110254; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+otp2F30HYnVaW0wjGWSRpaE6+qcbVlZ832snl2PQg0=;
 b=tvg83VxAmfz2MXCFPVwKzMWas7xr7nH8rvDFpChf1Ki6DdasccECMoNZNQjWdf0QBW
 rYti6PYgTnhhfqkaPvEM8ixPWSqN4PYu8VMK+3hBTRZpGENTP0ooOFWUp4WokXsdt0+5
 Pe7PcWogyIMqTTP2W1lWkg2u4Cp5FF2WUo/D/sAEfpLKWWsPycaMKNmYTRPCFDjhjLoF
 +De9lCY2j0jfzf2qSf+xu3nSr2VYQpwGD4hcBi1Wy+VSCjzodL71yC0Rw46Vg1xj37JA
 qfr70cDuDOuavdYnH19mSSrhh+JZr64dLUr21p4G20xAXuzmtYka0fvK1K2LTC9E9aQU
 P5qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719505454; x=1720110254;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+otp2F30HYnVaW0wjGWSRpaE6+qcbVlZ832snl2PQg0=;
 b=Wkj9mU2KJosdA/QGovva8n2HpBCr3PBlcDhCsCt7LQZ6t+1nVx2Te+rP4wOpUvS70E
 5nx68x90mLgm4lH9NKrCp6k2jsxIlUtLS3NevekoR/bkrlQH1hIQb5afUL+DP6eDMlvq
 bvV0Z6BeYlumRF+1/QJ0sZd92sk3ulY18HFrMNfUdRS9KiozxmTgINLjRrH5t96js07T
 J+EV4D0wOfr8cGNKHltWJR0pt7vNqMB/b3Z+EA7EjeBK2BZFE9laS7yXbndR1qebzB4G
 Q+qVe8J/y5XODKmbAFvhDlRNnK8avo45/0FKBiGnvMMJRa7eNSDX0FDHBUaOg/aacoFE
 OpUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOtz1PL6gPcdWhBJiPH77Y35k87gp2lIpJjARgJNW7pmpbJNUdr5H1mq9uwIgR27JDEtwrYIfseYn+D/uIWme99ykl
X-Gm-Message-State: AOJu0Yw/KOjs4vBuMzny+1nL6gJWdjJ8nweybMnySaxiA2yq7yhIEYp8
 c7LNOs2MDfH+R1IqQkFDJFC9tWhZXs6WEcCquroJtIqWvbs6bl+XMmmjN2k34Tw=
X-Received: by 2002:a05:600c:6d48:b0:424:a308:1746 with SMTP id
 5b1f17b1804b1-424a30817fbmr69581105e9.16.1719505453885; 
 Thu, 27 Jun 2024 09:24:13 -0700 (PDT)
Received: from localhost.localdomain (33.red-95-127-46.staticip.rima-tde.net.
 [95.127.46.33]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-424c8245d9dsm75125565e9.4.2024.06.27.09.24.07
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 27 Jun 2024 09:24:13 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 Tyrone Ting <kfting@nuvoton.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bin Meng <bmeng.cn@gmail.com>, Hao Wu <wuhaotsh@google.com>,
 Francisco Iglesias <francisco.iglesias@amd.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Sai Pavan Boddu <sai.pavan.boddu@amd.com>,
 devel@lists.libvirt.org, Luc Michel <luc.michel@amd.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 07/17] hw/sd/sdcard: Send WRITE_PROT bits MSB first (CMD30)
Date: Thu, 27 Jun 2024 18:22:22 +0200
Message-ID: <20240627162232.80428-8-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240627162232.80428-1-philmd@linaro.org>
References: <20240627162232.80428-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
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
X-TUID: 96qJwvUL1uKr

Per sections 3.6.1 (SD Bus Protocol) and 7.3.2 (Responses):

  In the CMD line the Most Significant Bit is transmitted first.

Use the stl_be_p() helper to store the value in big-endian.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Cédric Le Goater <clg@redhat.com>
---
RFC because I'm surprised this has been unnoticed for 17 years
(commit a1bb27b1e9 "initial SD card emulation", April 2007).

Cc: Peter Maydell <peter.maydell@linaro.org>
---
 hw/sd/sd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 1f3eea6e84..4e09640852 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -1507,7 +1507,7 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
             }
 
             sd->state = sd_sendingdata_state;
-            *(uint32_t *) sd->data = sd_wpbits(sd, req.arg);
+            stl_be_p(sd->data, sd_wpbits(sd, req.arg));
             sd->data_start = addr;
             sd->data_offset = 0;
             return sd_r1;
-- 
2.41.0

