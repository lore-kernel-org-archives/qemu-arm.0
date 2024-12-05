Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp462211njb;
        Thu, 5 Dec 2024 14:22:51 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXLfyivBMJq/cLPdbXJBcdmrC3qsYoA1uXWqsoO/C521o2+wFU1Tfm8U0k836lvoO2vFLIV1XnxjM/sBg==@linaro.org
X-Received: by 2002:a17:903:8c4:b0:215:b9a7:5274 with SMTP id d9443c01a7336-21614d5d846mr8148815ad.26.1733437371424;
        Thu, 05 Dec 2024 14:22:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733437371; cv=none;
        d=google.com; s=arc-20240605;
        b=ealtkz3JyE5qlU0l018aOsK5QPBgthNFacdkW3IIpmfkIHxlMg/R+LrtKNrr+cRlcE
         cWWGTtB70St8VCLfRWzIZNJGa65u1BRJNg8RNTGOYdICt5z7N3SrOa0bJeFJmHa+yU/a
         qHbpG9F1WAQP+l7UK3f6+GLv0+NoExB3iJ18ZstuyIa4mfITWVp5BQhbXK9xf5JDyN/N
         uHnN9cknCvOzlvLe+GIXd1ofqfqHRyl4Lirbqoz/o3tqofznyrMz4zYOsQc9bNE5LSx6
         9zv6Va0ErUFmggVU4F3gRDi2bE26rVCXIQtKRXImN6Js6Oo/r8jADLahfwJJlLm/KHqP
         9v5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=H5Lu6p0mGuoLuKswKHrT0wMtIc0NP1LmOkh8ZXYhnho=;
        fh=8fFCN+IgyRrsTnJEYysNAh2SAl3I0CMLBtd7rAIkIb8=;
        b=Me5a0S259MM75e8TpLRcpO4+Aq4aEDUAsQOcpAEHtp5zdGCEO3IcD2ypaFj+EpnVdU
         ZIDU5/XuOQTY4S0z4BeOozCptWIz8xAi7k7zQhgDD3jUzkeRRCNmy7fkTB1PwWtOsp1i
         DGJcnZChbGlwPwvS7Ro/3XXoDs+Gh4UcK69uX0c0wPFoEEdCbTpne/5yGCEwGLuhOOFG
         O07wkd0h3qbJe0OXQFCR56quW7yu1TYn5OAINWJPCw2WTyaia6Cj1yn7OwwqP6c0CASV
         tH50aoVs8Kfdh9w/6kJNS+pyCMm6SGFJKZRXS5jmWXuzWznr8Du1phJ3D6blLDZScOKj
         vOiQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="GcVfcmD/";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-215f8e4a21asor16701175ad.4.2024.12.05.14.22.51
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 05 Dec 2024 14:22:51 -0800 (PST)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="GcVfcmD/";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733437371; x=1734042171; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H5Lu6p0mGuoLuKswKHrT0wMtIc0NP1LmOkh8ZXYhnho=;
        b=GcVfcmD/9WJ8SXnpUH1aepfw0ApmLayh3Hn4EpmbqiAOJfqtL+ZrH72SkA/69F58d4
         tO4k/T4yyybxR+S7n98u2FKAbKfz2s47YFfHtV0kYtLTRMuOHqd7V56JR02PSLU1yuvj
         X8h/NmljHkpToyhSAtddfwiOngRlX3VndvKm84hFjDNtQemzeC4TS8rzE8JZoK72H88d
         w+bqG6rzU/KG4BsDJklxX4uP2mv4P0H1uiUL8q0rAQJ6Ftogc5Q7uXR/o9haUroeSzGx
         r0yLAS1GWKy5wmiS7G2Gxg/8zymPVgPvliMPZ/phJwgu0nb7xoa8haNavji+BXQWb6RT
         F/OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733437371; x=1734042171;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H5Lu6p0mGuoLuKswKHrT0wMtIc0NP1LmOkh8ZXYhnho=;
        b=h0YYdCW2UZR/p9ZnRruiQk7W/0cQgUEGIwN2W4N3hhIeZntuZ/lF44Rc2LD2nqDQuQ
         EbL3rzsK+lOmzeudusHFZLSMUBpYpq3lqtmUJteNVVPvzEtz8xUk5oy5+Zl6GJ25TTgW
         OCeiaXHrx/uYNJWoF6bZQ+3nLrjjVhqEwZ2FJHY2RrjGtfz9XE1iLLKCg0v1qdBwZkh2
         rKIDkfV5hRlOsjhd4VJa127caTuJq1qVYcfYzl/td4v1yNdPjP5J4ZNaP9eiAOuTaM9v
         aXNlPr9LU0/oBnLw+2NC+0EimnbsvB3CNZuOKDWv7JRRDNAH8NPAcbfp41tGHL/WZE3P
         R7EA==
X-Forwarded-Encrypted: i=1; AJvYcCVbNi9sM7TzFVXngdBXWJ8zyjkt4AItn+tS/B9lTwszXX0v1EzHaT+zlanKKAlVn1uloa12jhad5FZvAg==@linaro.org
X-Gm-Message-State: AOJu0YykN85KOWsn0XMhXhphVvRMt1uqYGNxqV9qQrIpvYNVQTMf/gGF
	k1NnUEOvwFv4CwKu04+ly7TBnD+oX8Vs3WuvtOwFUTRLgFj+YL+ptLoWsq/m1YIDcQ==
X-Gm-Gg: ASbGncsI02HIFXTI7mekxWvm7mAK7BO3PAlh/2BMdsKDxGzzKX6oCJyDVrLiI14atfb
	ALzO+BFoyLnNyKHrSrDDKRX+eI/YxtuTi+31yLfqL/xwAdYygBBhBU5he2RlqwNW8wgtWqN899j
	1ZdC7lkd3jTRHIs3w19JXEaX2UGl8RWPEpBABWSgNGXtZeJ7+blO7/T4Cv3xIMVzhclFY9LqdvG
	EgGVDFvIX4BSFpoGpxwf7poXuMPAUs916Kvi+Udq6YoTR2WgwetnUdxSTm5Xh6JC4Jy3ZEM4XTi
	6FWpZNNu
X-Google-Smtp-Source: AGHT+IFyCwATFotsgQSxoCFijjdMuigGb94TLzAYgWFUObwOD3XnGp5ahGX4zbRs/+b89VCEbBA1vA==
X-Received: by 2002:a17:903:240a:b0:215:a05d:fb05 with SMTP id d9443c01a7336-21614d781cbmr10834045ad.32.1733437370969;
        Thu, 05 Dec 2024 14:22:50 -0800 (PST)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-215f8f0b571sm17310435ad.183.2024.12.05.14.22.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 14:22:50 -0800 (PST)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Fabiano Rosas <farosas@suse.de>,
	Kevin Wolf <kwolf@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
	gustavo.romero@linaro.org,
	Andrew Melnychenko <andrew@daynix.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	Konstantin Kostiuk <kkostiuk@redhat.com>,
	Eric Blake <eblake@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Peter Xu <peterx@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Yuri Benditovich <yuri.benditovich@daynix.com>,
	Jason Wang <jasowang@redhat.com>,
	Michael Roth <michael.roth@amd.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	manos.pitsidianakis@linaro.org,
	qemu-block@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 2/6] docs/devel: add git-publish for patch submitting
Date: Thu,  5 Dec 2024 14:22:37 -0800
Message-Id: <20241205222241.3789437-3-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241205222241.3789437-1-pierrick.bouvier@linaro.org>
References: <20241205222241.3789437-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: Bs7evRNLQAYT

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 docs/devel/submitting-a-patch.rst | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/docs/devel/submitting-a-patch.rst b/docs/devel/submitting-a-patch.rst
index 03b2ac298aa..f8b7fc59544 100644
--- a/docs/devel/submitting-a-patch.rst
+++ b/docs/devel/submitting-a-patch.rst
@@ -235,6 +235,25 @@ to another list.) ``git send-email`` (`step-by-step setup guide
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
 .. _if_you_cannot_send_patch_emails:
 
 If you cannot send patch emails
-- 
2.39.5
