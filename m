Received: by 10.25.27.66 with SMTP id b63csp275534lfb;
        Fri, 27 May 2016 10:06:30 -0700 (PDT)
X-Received: by 10.55.5.66 with SMTP id 63mr14590361qkf.84.1464368790561;
        Fri, 27 May 2016 10:06:30 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v42si18365010qtc.30.2016.05.27.10.06.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 27 May 2016 10:06:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:47055 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b6LDR-0003V0-VS
	for alex.bennee@linaro.org; Fri, 27 May 2016 13:06:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55405)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1b6LBp-0002NC-2F
	for qemu-devel@nongnu.org; Fri, 27 May 2016 13:04:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1b6LBo-0003pe-6E
	for qemu-devel@nongnu.org; Fri, 27 May 2016 13:04:49 -0400
Received: from mail-lb0-x242.google.com ([2a00:1450:4010:c04::242]:34772)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1b6LBn-0003pR-PF; Fri, 27 May 2016 13:04:48 -0400
Received: by mail-lb0-x242.google.com with SMTP id t6so6051453lbv.1;
	Fri, 27 May 2016 10:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=1cQ2KGghloS9zt1cFhSKiXXnVTQCRPPP+9SzE0vCmao=;
	b=AedpYhXlbjpiVWNt/RBJV3WjzhiimAI2KfD8py5xyOV8Cfbf/fWDARFT8+lwVkKqTW
	ULaD/bgdJjnawVg3QEd2MFEVlDgZiyVReRHQ9t2sxtmrGy0XE/tk3A5v93DOXqrej44S
	uQtTVOSp+csPpN35FlgXWP4J3dAxfPON6RYJRL1bb1OA1Kc7ytNcxPFNRzVoiT8Xyr7a
	Nk76mppBOWhWwy7xms5VCFhzaNPQcHL2VZMAAyyeRruhcJ3fY5JSQoi4WhsMtuCfsiIu
	nHpxhbK2EfEFB5ALxGvWL/1FjrWjU9VgHnMqKNF357ex3Tc6r/gf3NL4gs3ZC+AEwar+
	mAKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=1cQ2KGghloS9zt1cFhSKiXXnVTQCRPPP+9SzE0vCmao=;
	b=I19UJmIEPHiICtnNutQhr75VLFX79MKWTsnN3IA0C6y/vBQPpYNO7aIZmP35cM5k8y
	cGVO5HjccXd90r3G8Tydi4aNCxllzru94alEbTzNcbLtaKouW4txzD2trB8EN9jEQHHV
	4hGjeYw96bcvoAZEZ75T0X9fw55xK0DNFlYzo3YOcS8mG1oGlkgQO6A07EUNfLi+Mlls
	UgucwAn5BN2hsZ0a6fxpZeAaX/rDfArnIA6yRMUJEbdkSgj4AA949FQXB3iIymwjb0uH
	tx4nBHMZOspQaOTfpMaaTziPnYUNo6kE2iM94tk73QS2V/HmExHzz+BYVeW1qQXLIWtI
	jPNQ==
X-Gm-Message-State: ALyK8tJKHjSMR3SD5jwk96XFMDNSdHfWKUhs8Z2pv9tZIAmmimtjjNdy+CtNuERLwQMjww==
X-Received: by 10.112.219.195 with SMTP id pq3mr4903559lbc.33.1464368687079;
	Fri, 27 May 2016 10:04:47 -0700 (PDT)
Received: from localhost.localdomain ([109.252.52.1])
	by smtp.gmail.com with ESMTPSA id p4sm3123088lfe.40.2016.05.27.10.04.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 27 May 2016 10:04:46 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm@nongnu.org
Date: Fri, 27 May 2016 20:03:33 +0300
Message-Id: <8f1fa9f90d8dbf8086fb02f3b4835eaeb4089cf6.1464367869.git.digetx@gmail.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <cover.1464367869.git.digetx@gmail.com>
References: <cover.1464367869.git.digetx@gmail.com>
In-Reply-To: <cover.1464367869.git.digetx@gmail.com>
References: <cover.1464367869.git.digetx@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c04::242
Subject: [Qemu-devel] [PATCH v13 5/8] hw/ptimer: Introduce ptimer_get_limit
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eolnQPXDR8dw

Currently ptimer users are used to store copy of the limit value, because
ptimer doesn't provide facility to retrieve the limit. Let's provide it.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
Reviewed-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
---
 hw/core/ptimer.c    | 5 +++++
 include/hw/ptimer.h | 1 +
 2 files changed, 6 insertions(+)

diff --git a/hw/core/ptimer.c b/hw/core/ptimer.c
index d0b2f38..05b0c27 100644
--- a/hw/core/ptimer.c
+++ b/hw/core/ptimer.c
@@ -225,6 +225,11 @@ void ptimer_set_limit(ptimer_state *s, uint64_t limit, int reload)
     }
 }
 
+uint64_t ptimer_get_limit(ptimer_state *s)
+{
+    return s->limit;
+}
+
 const VMStateDescription vmstate_ptimer = {
     .name = "ptimer",
     .version_id = 1,
diff --git a/include/hw/ptimer.h b/include/hw/ptimer.h
index 8ebacbb..e397db5 100644
--- a/include/hw/ptimer.h
+++ b/include/hw/ptimer.h
@@ -19,6 +19,7 @@ typedef void (*ptimer_cb)(void *opaque);
 ptimer_state *ptimer_init(QEMUBH *bh);
 void ptimer_set_period(ptimer_state *s, int64_t period);
 void ptimer_set_freq(ptimer_state *s, uint32_t freq);
+uint64_t ptimer_get_limit(ptimer_state *s);
 void ptimer_set_limit(ptimer_state *s, uint64_t limit, int reload);
 uint64_t ptimer_get_count(ptimer_state *s);
 void ptimer_set_count(ptimer_state *s, uint64_t count);
-- 
2.8.3

