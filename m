Received: by 2002:a17:504:1dd4:b0:1be9:327d:8ee3 with SMTP id b20csp2391846nji;
        Mon, 15 Jul 2024 10:33:35 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX2H6qKTUCt405NWL9PMogsih2ieWU/Me5o3HDlMG8Am42+0Q2kxPp4gMHTZ0UECG4BZpcC/1QwwMElEAd+0QzY7YjAAqOr
X-Google-Smtp-Source: AGHT+IEQXZzkfJHdu9W1hutUHCfauxR6znTiH+lhzbJEptvTYQDOpaK9RzM/y02+dZEdwrIysYAC
X-Received: by 2002:a05:6214:529e:b0:6b5:2b33:5445 with SMTP id 6a1803df08f44-6b77de94c29mr3708666d6.25.1721064815417;
        Mon, 15 Jul 2024 10:33:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721064815; cv=none;
        d=google.com; s=arc-20160816;
        b=MKP93mebi5gjRN8+DgCRHW3tVFmXcV/8v3fFNPn5VhenMv3BG6Tof3kucxIudgb4fx
         RrwYocW+DBncReabSWkWFBHXw267Te2vyu6jU55JLk+7kjQEdZuRzaDXrEiYC2Oz3sIU
         mrlT3/n4l36IuR7NtBaSmFX2b7+Bc6oOuWXtEKaw+ID6HW1oUh2NRfAcrHAWsyf8e4BE
         5hwTGXLSXBbFnPu9YxRJROFQmZ7uRq1kveW09xQ6eHs2JVpAApMqzpUAVxpR2P0u7omP
         M6O6nKCwQUghK/OT/MtFOKbVyYAaqIYUlgR+BPyA6tNS1s2fM285oNmPjVkjyyZY2pOC
         H8Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=GswL2wmVuqQkRjWn0doTswPT9wVRl9x4I39CHCAPioo=;
        fh=Vh4aLTjuyylyycFlCkrZ7Ouz37ZrS6wbH/qgUthxXT8=;
        b=d7FXUBDsCVnkCk91TjCN7pGAsne1ydBSXYcWs5WZIRCqUaohqR/lOkCoxF2BaD0VoH
         B0L7XjhxN0uVcTTng9LIV4EdaYsLJEfII6AZwlN8k93JHqI44XU+UEGgQWV4WmDBVFle
         lxK4fuvtBBYw5vZ+tOicyiUbPXXVmaRYzmcyO9q/yzdHAM5HQd4sx4LkcECU+hmD+Fxl
         qEoUjX7pCHP17va+Dusoafc4Vg2g2E1PSXnXWWOgOz7ryKlyelzIxxT4eOlZ1nay/qVS
         kAfHqw+Trjg9oOhPJDqp6nx3ngR0rUi1QxZE/AO+qB6++JMQo3FCPv7ElI7Nnhylkrr/
         B6CA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IGQt3QCw;
       spf=pass (google.com: domain of jsnow@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=jsnow@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <jsnow@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b761a03850si56598086d6.192.2024.07.15.10.33.30
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 10:33:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of jsnow@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IGQt3QCw;
       spf=pass (google.com: domain of jsnow@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=jsnow@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721064809;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GswL2wmVuqQkRjWn0doTswPT9wVRl9x4I39CHCAPioo=;
	b=IGQt3QCweimRJjcJnhFH4v5l9wZ+V0eURxs8H8H/BevRKZa7YExZtePYSaapXs5GcJoaq3
	TpU9oweK0Vz8XzMaTkGUvJpxN8IyqNxbQb0P9RTSDxrc6Z76P8vhw6calH2U0aVCg39nbA
	vLnaL+vvCS5wIMKUy3X2+yzaWXHb4Lw=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-116-R3B7USsvOpiIEbnAgXPHjA-1; Mon,
 15 Jul 2024 13:33:26 -0400
X-MC-Unique: R3B7USsvOpiIEbnAgXPHjA-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E3D921955D47;
	Mon, 15 Jul 2024 17:33:23 +0000 (UTC)
Received: from scv.localdomain (unknown [10.22.65.127])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 4CBCE1955D47;
	Mon, 15 Jul 2024 17:33:18 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>,
	Joel Stanley <joel@jms.id.au>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Leonardo Bras <leobras@redhat.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	qemu-block@nongnu.org,
	Eduardo Habkost <eduardo@habkost.net>,
	Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
	Cleber Rosa <crosa@redhat.com>,
	qemu-arm@nongnu.org,
	Fabiano Rosas <farosas@suse.de>,
	Hanna Reitz <hreitz@redhat.com>,
	qemu-s390x@nongnu.org,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	John Snow <jsnow@redhat.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Michael Roth <michael.roth@amd.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Andrew Jeffery <andrew@aj.id.au>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Beraldo Leal <bleal@redhat.com>,
	Eric Farman <farman@linux.ibm.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Ani Sinha <anisinha@redhat.com>,
	Juan Quintela <quintela@redhat.com>,
	Eric Blake <eblake@redhat.com>,
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
	Thomas Huth <thuth@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Peter Xu <peterx@redhat.com>
Subject: [PULL 5/6] Python: bump minimum sphinx version to 3.4.3
Date: Mon, 15 Jul 2024 13:32:40 -0400
Message-ID: <20240715173241.572048-6-jsnow@redhat.com>
In-Reply-To: <20240715173241.572048-1-jsnow@redhat.com>
References: <20240715173241.572048-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
X-TUID: xbX6pXQc9iLT

With RHEL 8 support retired (It's been two years since RHEL9 released),
our very oldest build platform version of Sphinx is now 3.4.3; and
keeping backwards compatibility for versions as old as v1.6 when using
domain extensions is a lot of work we don't need to do.

This patch is motivated by my work creating a new QAPI domain, which
unlike the dbus documentation, cannot be allowed to regress by creating
a "dummy" doc when operating under older sphinx versions. Easier is to
raise our minimum version as far as we can push it forwards, reducing my
burden in creating cross-compatibility hacks and patches.

A sampling of sphinx versions from various distributions, courtesy
https://repology.org/project/python:sphinx/versions

Alpine 3.16: v4.3.0 (QEMU support ended 2024-05-23)
Alpine 3.17: v5.3.0
Alpine 3.18: v6.1.3
Alpine 3.19: v6.2.1
Ubuntu 20.04 LTS: EOL
Ubuntu 22.04 LTS: v4.3.2
Ubuntu 22.10: EOL
Ubuntu 23.04: EOL
Ubuntu 23.10: v5.3.0
Ubuntu 24.04 LTS: v7.2.6
Debian 11: v3.4.3 (QEMU support ends 2024-07-xx)
Debian 12: v5.3.0
Fedora 38: EOL
Fedora 39: v6.2.1
Fedora 40: v7.2.6
CentOS Stream 8: v1.7.6 (QEMU support ended 2024-05-17)
CentOS Stream 9: v3.4.3
OpenSUSE Leap 15.4: EOL
OpenSUSE Leap 15.5: 2.3.1, 4.2.0 and 7.2.6

RHEL9 / CentOS Stream 9 becomes the new defining factor in staying at
Sphinx 3.4.3 due to downstream offline build requirements that force us
to use platform Sphinx instead of newer packages from PyPI.

Signed-off-by: John Snow <jsnow@redhat.com>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Acked-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-id: 20240703175235.239004-2-jsnow@redhat.com
Signed-off-by: John Snow <jsnow@redhat.com>
---
 docs/conf.py    | 7 +++----
 pythondeps.toml | 2 +-
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/docs/conf.py b/docs/conf.py
index aae0304ac6e..876f6768815 100644
--- a/docs/conf.py
+++ b/docs/conf.py
@@ -53,10 +53,9 @@
 
 # If your documentation needs a minimal Sphinx version, state it here.
 #
-# Sphinx 1.5 and earlier can't build our docs because they are too
-# picky about the syntax of the argument to the option:: directive
-# (see Sphinx bugs #646, #3366).
-needs_sphinx = '1.6'
+# 3.4.3 is the oldest version of Sphinx that ships on a platform we
+# pledge build support for.
+needs_sphinx = '3.4.3'
 
 # Add any Sphinx extension module names here, as strings. They can be
 # extensions coming with Sphinx (named 'sphinx.ext.*') or your custom
diff --git a/pythondeps.toml b/pythondeps.toml
index 6aba0c9daaa..f6e590fdd86 100644
--- a/pythondeps.toml
+++ b/pythondeps.toml
@@ -23,7 +23,7 @@ meson = { accepted = ">=1.1.0", installed = "1.2.3", canary = "meson" }
 
 [docs]
 # Please keep the installed versions in sync with docs/requirements.txt
-sphinx = { accepted = ">=1.6", installed = "5.3.0", canary = "sphinx-build" }
+sphinx = { accepted = ">=3.4.3", installed = "5.3.0", canary = "sphinx-build" }
 sphinx_rtd_theme = { accepted = ">=0.5", installed = "1.1.1" }
 
 [avocado]
-- 
2.45.0
