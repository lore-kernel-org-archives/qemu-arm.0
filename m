Received: by 10.25.0.198 with SMTP id 189csp1191528lfa;
        Sun, 7 May 2017 21:58:18 -0700 (PDT)
X-Received: by 10.233.237.72 with SMTP id c69mr24992643qkg.201.1494219498403;
        Sun, 07 May 2017 21:58:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1494219498; cv=none;
        d=google.com; s=arc-20160816;
        b=CKRvbOG7kDcdMvTv33eWZKmWoeUzKAxNBTvWHoqtBCVbcjyypVqe4uZp6g+5LhC/pu
         7O/HGGj2AqEDhNzoAq5xAMAblZ48FQA+vX7Og97BVxBGN2gL9z8KJKjlZO8/WUcDdaLO
         62uNNvAyn5kcfdZmmQk2OzULmbIye4zA7ZsigdQuKQ0N2ajboGNFo3PrVTxSRGIHvay2
         H42xI1v9VVeCA+piX/kSgKW/gqPdBHLiS2yzSBzVdAbzm7Jfd+CHRcQUoY92q2b0PDii
         rb2Emv0y899eA2xsxC7n97SER9lwdPV5z8w8AJBlNC8EwqQhTMMJTL4RlYt693Q5o95h
         DQSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature
         :arc-authentication-results;
        bh=6km89AiHl3JfdFR5TGGovBpzp5wFub7X26Epj0KFw1Q=;
        b=eLD98B/FCIyqb4h0lCPXB0uZWROyATVCWk5e191VVbew1dVMK21gsXXemGREBJgzXY
         miYIOs8dbkpFOpCrbWWijbM+nehsVKxPI5HLcWUCdTvnfR15H1mqZfKFAfgQzpqpufEE
         viJbn5BVSxA2QznWnnmErgm2gVpfSS1FcS3QlDM+gBE8/tk3qou++hh5k6MXwUe5+ks1
         KWvW6ZGIQVkj1dXWuj/4/hROGwVzjPONb8WS3fGa+Gxj7WBeNFdECcOn9KmDIBQTiiD7
         Nj6RBxixAoJ1eO7W1HwdZo/RqOkkVJK9I3MXHh8EyJXjrMBfuKrCqsdpYFRdS2g4lpTi
         wsIw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 2607:f8b0:400d:c0d::241 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-qt0-x241.google.com (mail-qt0-x241.google.com. [2607:f8b0:400d:c0d::241])
        by mx.google.com with ESMTPS id v32si3006320qta.337.2017.05.07.21.58.18
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 07 May 2017 21:58:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 2607:f8b0:400d:c0d::241 as permitted sender) client-ip=2607:f8b0:400d:c0d::241;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 2607:f8b0:400d:c0d::241 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com
Received: by mail-qt0-x241.google.com with SMTP id l39so8241970qtb.1;
        Sun, 07 May 2017 21:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6km89AiHl3JfdFR5TGGovBpzp5wFub7X26Epj0KFw1Q=;
        b=g90hBoeleZxRwCKV8ETqppWVNUzuk61VEfi7BGz84Q7rGNwrR7CXbS6mNQBZUcam44
         w+/S9I/w3xlMyD1ZYjWLkKjR12G263pLBWsQ5wZCw1USxRWpT9nGMLx8m3zUuJ0v824I
         t5/BLFHh2PnGkaMis7jVIhvezaqH1sm6xPnFEkA4D/Or9npDdkGTcHmVc/Qgy2/kQ5FC
         4S3mZ6WgorSpCeAB/pKVK8iwOe6+4GNK7RzxiNtrTbW4jIJ1imCXJVDP7onzYSKHW2yl
         qLZBsZN8QGnHGIP2v9k4Xv3/p6m8hnLudYq6VIYXOL49CBykz2+5yk9mD29lkrfN+IFW
         W3Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=6km89AiHl3JfdFR5TGGovBpzp5wFub7X26Epj0KFw1Q=;
        b=ljH6xh9H/faXXnKp0/cZNiqaeCHv4sYZQV87nyMTg4ppshP3ZClfeGL42FtOA1PMaX
         HQPW+xbyvVe3Df2j5l8o515Byb5VvsTINKIYUwHOUhPEaQYIiP5dYRubkTlO6ZG/kyf2
         B2CyxBmvFwifj4RK1aVhmsWJ4ZBjrm52O5QefX3/t0nwq5tcPUbiGQCiGbINMRtM0fSw
         EPgimKnbeKY6lZLeiJT9eTcExd49rFi4qYyFe5ZSHOuvoJObr8gAsqiEQYBT/m2NvFz8
         OC+IfOicdFyZktMbsch88UwQ6iGcGqfbjrpWpw4vR6HaW7V4CcImA5q3LpHNaoIrlT8f
         D00w==
X-Gm-Message-State: AN3rC/5WY2qUolhGNrgnDJv65gGlPKzZT7oKzC0bUpE1y9QGKtrvmtMF
	JV4daSd95qToeGYQtao=
X-Received: by 10.237.37.21 with SMTP id v21mr22262037qtc.97.1494219498098;
        Sun, 07 May 2017 21:58:18 -0700 (PDT)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from localhost.localdomain ([138.117.48.226])
        by smtp.gmail.com with ESMTPSA id m188sm4358549qkc.5.2017.05.07.21.58.15
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 07 May 2017 21:58:17 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Fam Zheng <famz@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH 08/23] docker: add extra libs to arm64 target to extend codebase coverage
Date: Mon,  8 May 2017 01:57:00 -0300
Message-Id: <20170508045715.21770-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170508045715.21770-1-f4bug@amsat.org>
References: <20170508045715.21770-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 5VC+nzOrYskR

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tests/docker/dockerfiles/debian-arm64-cross.docker | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/tests/docker/dockerfiles/debian-arm64-cross.docker b/tests/docker/dockerfiles/debian-arm64-cross.docker
index 12b30aae54..5e0036917b 100644
--- a/tests/docker/dockerfiles/debian-arm64-cross.docker
+++ b/tests/docker/dockerfiles/debian-arm64-cross.docker
@@ -14,4 +14,10 @@ RUN dpkg --add-architecture arm64 && \
 # Specify the cross prefix for this image (see tests/docker/common.rc)
 ENV QEMU_CONFIGURE_OPTS --cross-prefix=aarch64-linux-gnu-
 
-RUN DEBIAN_FRONTEND=noninteractive eatmydata apt-get build-dep -yy -a arm64 qemu
+RUN DEBIAN_FRONTEND=noninteractive eatmydata apt-get build-dep -yy -a arm64 qemu && \
+    DEBIAN_FRONTEND=noninteractive eatmydata apt-get install -y --no-install-recommends \
+        glusterfs-common:arm64 \
+        libncursesw5-dev:arm64 libnfs-dev:arm64 \
+        libbz2-dev:arm64 liblzo2-dev:arm64 \
+        libsnappy-dev:arm64 librdmacm-dev:arm64 \
+        libxen-dev:arm64
-- 
2.11.0
