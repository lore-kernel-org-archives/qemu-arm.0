Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp2794042njb;
        Mon, 9 Dec 2024 10:31:10 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWE+SqOVNUDNPN6WhdZGdxZoxe+/PmzRVhyhHubm8+EiTdcaZu35czp+aaaXb98ILEVpbo5VHRutd0/UA==@linaro.org
X-Received: by 2002:a05:6a20:918d:b0:1e0:cb94:d3b4 with SMTP id adf61e73a8af0-1e187150d24mr23216800637.45.1733769070438;
        Mon, 09 Dec 2024 10:31:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733769070; cv=none;
        d=google.com; s=arc-20240605;
        b=d9pTXxGhHQVHk54WsTqUwGDnjf8kHH5DVO91wybkFxZ6iFMDQSQIFp9dP/n8mhnznw
         MsKBEamB0XTjdSOKqfYjrOl7uBkaojQdjc+NroFK+0SsN6+vqLIfMjNzJ1rXnxGDIImc
         VHborcwBLQG8ZpsYSG2tK9W0cQbJxiTVkkVYY0nULXAIH0+eP0/emYO6yeZlvVpmpfMf
         ugHHP8NMAO0kiI1E4y/c7N2qjOet/n4FscpE2XPxX3+dbF6NOcfj6qgiuoNDbAt+duAA
         +QZBOk3qY3sQfxYqQwO5EVKiQ5VR4wi0xd9noPTkQZiqcUbDIYled8gYUpWs/2TmQ+2C
         hxgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=oUKq6vEd08BNHFL5xy+IGBW1qUyoIpn1SmzghDG21Ks=;
        fh=K9Oak7SeSg/TnKM/temluUGGlBVyWS5bDpg5GA+kD5Y=;
        b=K77qNlykM5otgRr6IzRrrSwos0OJHAM6HcegszJUCXxo01D+SLcUaozgjBufTmbdA+
         cWI+M6fEjkZJQyzClY3LRcWaPL8UpMSA71brrdw+Gv2ylOjdW+LxarzfdS9Pq/D1gxje
         heVOpC8aqKlWROlIFNc4dkCS1njQ5iNU1b0UNA/TMKxwVx9fiySY29dw7Mfh1Q1llaaA
         BEEjqCmCE+DCPZsv/o941XIbfcPtZ4RfCNQUmisonrM0gj6Jw+r3IPKjWwZ3bZi5wsBh
         icvBLnEBXPjRaDTsQRe//f3hlG/piZ9nwlztIa1vl+5yVL/429c4+GDk4QDurLCQvsxl
         viHQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fgCSKbUF;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-725cd11aac1sor2170619b3a.6.2024.12.09.10.31.10
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 09 Dec 2024 10:31:10 -0800 (PST)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fgCSKbUF;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733769070; x=1734373870; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oUKq6vEd08BNHFL5xy+IGBW1qUyoIpn1SmzghDG21Ks=;
        b=fgCSKbUFgbyiQGoOx9Y80YLyBjQX+ZOsRCHqoOP+mkVnNchMNLOs/zoF7YQIxXFKYl
         n1PvD7ViwL2qf/FACnJafIUFJv35bL1x/z0QcWltcighMMCFzK7q4WJQUOOh+Nf1sBg7
         QVe84EO/y5WQO55wsGqE/wREhGkHj7d85jGkGGDGLkWqVjawGfhGNNsKk6j9820rnYtr
         +ycB8/I84jwkPkRWgucnEgKF5FdeOj82tH73WaTgbPmLyCmA9kLlig7tyz6Z6AQReHX0
         8TcbO8i1THFQ1idhoFrckLfuL5aSyOESmUnLIv5xh5IjKmLf4Z5Pp2zUykaYDaPpP0TH
         SXIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733769070; x=1734373870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oUKq6vEd08BNHFL5xy+IGBW1qUyoIpn1SmzghDG21Ks=;
        b=YR0PLXtYLwvANGQwll8duQVXwN20ODH/eLWlOY++LAsISWL6qe6++ujx+a1LscCpUA
         mp4ba7ZrpPPlVyBTqmwchyN+eq3d3YhfeskG2j2HXHcabyJKV7TXXwFMAGQDCVG59V/8
         WuiQZhoAoKtb/hbcD6HJAsZPQAO5u2CDLJKcj2gaAQL7Z2PQnaJWVva4HvzwIhusMCKI
         DVmq53yK2mgymvXS85Vndcqq8+bFPDVPWxzVAoZ6xzSoKW2CFHJyQpNZtA/T8Mvc3dg4
         QB5K08LPB8GfnxNnqWxEbaXhiKSeUFwEJC9dD5Rs1TIUhn7w5vkij/EQ4iKzATUoOFNa
         0iwA==
X-Forwarded-Encrypted: i=1; AJvYcCWRO3reVTx34ukcaK/v+VCbmP1Lts6o2OZ6AYfN5+lcvc/GAf2RFfHiKOlvmwfcjAeHXVu6kFsVikEO4Q==@linaro.org
X-Gm-Message-State: AOJu0YxnXla74hOJ+B1xijuJkEDur1GmbLtUoaPJqigdgwwmouQbj2oy
	OjJkb660xzkTQc4TUdw2XUIJpltNk3WMFmYn5o0Bgorr0h7qbhYqP3VDRvKaAz7UOA==
X-Gm-Gg: ASbGncvwpMs4wCRSc20KKX+FUNZaNa5t2u164MK2nMh8lstksrhYz6RARSwkvOQ/EcD
	xL/zOXlp4/NVwS3xre1gPKbj2bpiTYcyiKWDsFRMDYmAcYGGuK9vx9SZUjOGYIUCNkCIv413F6x
	QDW5Dinb/7IDL/ZjlJv+clLovix9dFpFFACwlLGtz2cY7WvJyAlVrIZ0d9Z8EE4PPEWRbedxK76
	eabWTTxUwEkMCh0t8vVOFaI3gCn4cYfwmb5KdiYQYhPBmEMzPL76xGI70pt8uDkYE/zSkTxEZ8k
	36rdLv+yj1/2
X-Google-Smtp-Source: AGHT+IGHgMJ38Jmr7nbffgCDllf16U7JHr53zhYSJkDuJ8Dm6v3gmzXLAgJmZrZFftLzkhyV7DOVuA==
X-Received: by 2002:a05:6a00:174b:b0:727:3c8f:3707 with SMTP id d2e1a72fcca58-7273c8f3efemr2557724b3a.23.1733769069981;
        Mon, 09 Dec 2024 10:31:09 -0800 (PST)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725e2388d37sm3322821b3a.73.2024.12.09.10.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 10:31:09 -0800 (PST)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: manos.pitsidianakis@linaro.org,
	Andrew Melnychenko <andrew@daynix.com>,
	Thomas Huth <thuth@redhat.com>,
	Michael Roth <michael.roth@amd.com>,
	qemu-block@nongnu.org,
	Jason Wang <jasowang@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Yuri Benditovich <yuri.benditovich@daynix.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Peter Xu <peterx@redhat.com>,
	qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	philmd@linaro.org,
	Fabiano Rosas <farosas@suse.de>,
	Konstantin Kostiuk <kkostiuk@redhat.com>,
	Eric Blake <eblake@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
	Markus Armbruster <armbru@redhat.com>,
	gustavo.romero@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v4 2/6] docs/devel: add git-publish for patch submitting
Date: Mon,  9 Dec 2024 10:31:00 -0800
Message-Id: <20241209183104.365796-3-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241209183104.365796-1-pierrick.bouvier@linaro.org>
References: <20241209183104.365796-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 8y5R46Ib/zSe

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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
