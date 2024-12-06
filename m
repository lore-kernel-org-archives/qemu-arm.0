Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp1091944njb;
        Fri, 6 Dec 2024 11:29:13 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV6iAGov6/uHObJexK95x3x/eD0v5zlMUYlIMFevmnuIKGRIa7s4IyjQl2W/84FlTcTJyYY0L7INHCxYQ==@linaro.org
X-Received: by 2002:a17:903:184:b0:215:94b0:9de5 with SMTP id d9443c01a7336-21614e061a0mr59912345ad.48.1733513352632;
        Fri, 06 Dec 2024 11:29:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733513352; cv=none;
        d=google.com; s=arc-20240605;
        b=LgdvrMbx3uVSUX53AydKuaMXd9F6z2jE+HoAtuLiQh8DEvCIwyl90nADrVhLTReWY1
         mKpaC5D2X90R6FEthsUD1cGdt/4Pzvtc1yq467h0obPMEHkL9MJWVGCY+ksyHowLryzh
         PW6IRJfZVl1ErkKxw5fKM0CCTKr8hzO42Xy7SdoPQdulf74iYBLDq6cWDqBrQa8kM/af
         hW7h3o+MOL1kF+2MpeAdG6TBqg8m+hfnWLjaw55L3sVrd+WtykHh2irl7YwpTTydZa1k
         r1Ka2df0Rmgu2SoBZ9PoGTe7rEUCOlxb0pxv/+SiztWY3vFZFu0TI7khW4wv+2xtJHmB
         ClTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=YhN5xzTKOMEr8P5uJC22JY6ORCTpZxAfyG3HnT0ezPQ=;
        fh=dlEUcD8ZcfgEflNce8F2XoDr7YMn7yOGYsicH+SUb3I=;
        b=k72BvDErfpiXU6cLbQ60JvEoZ80eUkSOT0QQVUj0JOfAeDBm6DrxwYB/MqkvNyA45G
         xF/nqZyuLWNYoNFnvROyaIpNrTUmzE55gu2r7aTeMgKxdDu2n7Bvfg38Sa7V8P4fN3pm
         j23VidQaZ1lTIX3O/OQ3d6B5u7ANBS3Mn0g8GcnSxd/RSdYj7XO4yMzWgie5nvqJN82Z
         Cd+jdPv9R6teBEGSuXmrVCoi/+DfE8M5WFeKDPopoe6GyidDPsLHq8mzaaDvIvuvXdng
         rcSxXRAjm1jDZgcSjCO2264WJQ1oXu8VZV7hRkLYZFDfqxXG9eKIBEouifgno3w6lhg4
         fASg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="xM/84WZu";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-215f8ecee2fsor33178625ad.2.2024.12.06.11.29.12
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 06 Dec 2024 11:29:12 -0800 (PST)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="xM/84WZu";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733513352; x=1734118152; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YhN5xzTKOMEr8P5uJC22JY6ORCTpZxAfyG3HnT0ezPQ=;
        b=xM/84WZu6N+AMx9XNDOru5rWxQE3OjEPO2wsYFMfM09oVvUsHdzvd2JV5fGL3cU8es
         RKwrGU2RlsbIZHwJs9sAZblcH9GnPHyfvudPn16t8I3FhZEXQBnV3gHilahOIT4cSdYm
         N99lTD96vnkgjd7m0TS7Fv3qzRtMicek6DYFD+RRino5I2YnQttloLn3dTYpJwYCix10
         uj5uhnY2kvW4T7KsGn7+1i5cY11XOc2P3IWuROeLKI/Q2ztWJRd6h93NvHZCLc8Ii0IH
         IYL6WXm0f4JaY6F3KQX9LVBePyd+GTqHB9lBRFeOcIsR0+KcM36PgCh6D2/OM6brQBZ6
         V5uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733513352; x=1734118152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YhN5xzTKOMEr8P5uJC22JY6ORCTpZxAfyG3HnT0ezPQ=;
        b=JNV8By1D+zmvKoh/Ff/8D4ET8Gt6/3ZE9/wEQAY2jhgbH5FwIKwAS8xK0PMNBibn7o
         Q+TM+CrzCNOacZoummmKVPmGR2hDJJtcXT1glwYm8W+h6493033uiqbO1sWUPigima3w
         y9/4ekNJtShr2zMzL/PqC8bNAVZWC781ehVUhBnztYMgG2o4GhR+QpVbt6XKSASBhZR3
         YUSIIJHEv3h4hNFWwqZ5latQ+zGp5vtn8sFDNYANmniuEy3JgohLu5rkPLEGcvujVppB
         GdBp+VoRVU0miYqwzA3icaE+vQHqafPoDSqr8seeW9CiLRCHMSbkuKuKZTsZcZXKQZWp
         dU4w==
X-Forwarded-Encrypted: i=1; AJvYcCWdQPcUom6+hZ1Uv9GqHL6icgSATcg9Xf9279lWUmsOX1jXLF6+lbvUGgJYd46v2pIp5AhYLd/OEEtZJg==@linaro.org
X-Gm-Message-State: AOJu0YwTGLS2nkfBDsA0HJ5lK9I2Wg/rvs1lw15BCQWgthYBtkdyp5OC
	Y+mJk/0VuiOkaRMESYc1ZCy4t5G5dhu1G4wbhhu4UT3IXSjaR1mF75PqSsc6KJP+Xg==
X-Gm-Gg: ASbGncuAxeeQWYiT7Mdv9i1hQermKvEoUKJsqpEegiJCCnJ4pGQXN+8JW3HdwosriLM
	lvTgNrndDAf6LVfANGwx8L+NldhpOaTkexJBBSJPIesT162ZTBFVTEdL8oldZB+fgA5kfdhp5EY
	6pIlIKYBMR1e8o5qd7luEfLLFTmcd4omv7P/9lg63G7HsCtZme1GbVZJol48rwL6hDGMPlAerUC
	h3FnzLU3q5MwO7c1iO2gykJOqHdGrrPbabmxSwVi8QXaQbHW+vvpnAsa6M8cDYfWEwhdODMYdLo
	vYWh92EJ
X-Google-Smtp-Source: AGHT+IFDwS8hBE+y3jFfJJEZi4eQD0EEfUJjjDqdu9yebhzu6uqlKD0UZCl7qr1eNOsm3r3/DSXGCA==
X-Received: by 2002:a17:902:c405:b0:215:a3fb:b4d6 with SMTP id d9443c01a7336-21614d54353mr61890765ad.8.1733513350722;
        Fri, 06 Dec 2024 11:29:10 -0800 (PST)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-215f8ef9fcdsm32110205ad.146.2024.12.06.11.29.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 11:29:10 -0800 (PST)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-block@nongnu.org,
	philmd@linaro.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Fabiano Rosas <farosas@suse.de>,
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	qemu-arm@nongnu.org,
	Michael Roth <michael.roth@amd.com>,
	Peter Xu <peterx@redhat.com>,
	gustavo.romero@linaro.org,
	Yuri Benditovich <yuri.benditovich@daynix.com>,
	Eric Blake <eblake@redhat.com>,
	Andrew Melnychenko <andrew@daynix.com>,
	Konstantin Kostiuk <kkostiuk@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	manos.pitsidianakis@linaro.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 2/6] docs/devel: add git-publish for patch submitting
Date: Fri,  6 Dec 2024 11:28:56 -0800
Message-Id: <20241206192900.3893118-3-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241206192900.3893118-1-pierrick.bouvier@linaro.org>
References: <20241206192900.3893118-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: w1IYHCXV6Yrj

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 docs/devel/submitting-a-patch.rst | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/docs/devel/submitting-a-patch.rst b/docs/devel/submitting-a-patch.rst
index 03b2ac298aa..69df7682c5e 100644
--- a/docs/devel/submitting-a-patch.rst
+++ b/docs/devel/submitting-a-patch.rst
@@ -235,6 +235,31 @@ to another list.) ``git send-email`` (`step-by-step setup guide
 works best for delivering the patch without mangling it, but
 attachments can be used as a last resort on a first-time submission.
 
+.. _use_git_publish:
+
+Use git-publish
+~~~~~~~~~~~~~~~
+
+If you already configured git send-email, you can simply use `git-publish
+<https://github.com/stefanha/git-publish>`__ to send series.
+
+::
+
+    $ git checkout master -b my-feature
+    $ # work on new commits, add your 'Signed-off-by' lines to each
+    $ git publish
+    $ ... more work, rebase on master, ...
+    $ git publish # will send a v2
+
+Each time you post a series, git-publish will create a local tag with the format
+``<branchname>-v<version>`` to record the patch series.
+
+When sending patch emails, 'git publish' will consult the output of
+'scripts/get_maintainers.pl' and automatically CC anyone listed as maintainers
+of the affected code. Generally you should accept the suggested CC list, but
+there may sometimes be scenarios where it is appropriate to cut it down (eg on
+certain large tree-wide cleanups), or augment it with other interested people.
+
 .. _if_you_cannot_send_patch_emails:
 
 If you cannot send patch emails
-- 
2.39.5
