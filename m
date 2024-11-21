Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-433b4616fc2sm61609455e9.22.2024.11.21.09.06.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 09:06:23 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id F2F4460510;
	Thu, 21 Nov 2024 16:58:09 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	qemu-ppc@nongnu.org,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	qemu-riscv@nongnu.org,
	Thomas Huth <huth@tuxfamily.org>,
	Bernhard Beschow <shentey@gmail.com>,
	Thomas Huth <thuth@redhat.com>,
	Eric Farman <farman@linux.ibm.com>,
	Bin Meng <bmeng.cn@gmail.com>,
	qemu-s390x@nongnu.org,
	Niek Linnenbank <nieklinnenbank@gmail.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	John Snow <jsnow@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	qemu-rust@nongnu.org,
	Nicholas Piggin <npiggin@gmail.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Markus Armbruster <armbru@redhat.com>,
	Weiwei Li <liwei1518@gmail.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Ani Sinha <anisinha@redhat.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 39/39] docs: explicitly permit a "commonly known identity" with SoB
Date: Thu, 21 Nov 2024 16:58:06 +0000
Message-Id: <20241121165806.476008-40-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241121165806.476008-1-alex.bennee@linaro.org>
References: <20241121165806.476008-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: aVnzJ7R+HjSU

From: Daniel P. Berrangé <berrange@redhat.com>

The docs for submitting a patch describe using your "Real Name" with
the Signed-off-by line. Although somewhat ambiguous, this has often
been interpreted to mean someone's legal name.

In recent times, there's been a general push back[1] against the notion
that use of Signed-off-by in a project automatically requires / implies
the use of legal ("real") names and greater awareness of the downsides.

Full discussion of the problems of such policies is beyond the scope of
this commit message, but at a high level they are liable to marginalize,
disadvantage, and potentially result in harm, to contributors.

TL;DR: there are compelling reasons for a person to choose distinct
identities in different contexts & a decision to override that choice
should not be taken lightly.

A number of key projects have responded to the issues raised by making
it clear that a contributor is free to determine the identity used in
SoB lines:

 * Linux has clarified[2] that they merely expect use of the
   contributor's "known identity", removing the previous explicit
   rejection of pseudonyms.

 * CNCF has clarified[3] that the real name is simply the identity
   the contributor chooses to use in the context of the community
   and does not have to be a legal name, nor birth name, nor appear
   on any government ID.

Since we have no intention of ever routinely checking any form of ID
documents for contributors[4], realistically we have no way of knowing
anything about the name they are using, except through chance, or
through the contributor volunteering the information. IOW, we almost
certainly already have people using pseudonyms for contributions.

This proposes to accept that reality and eliminate unnecessary friction,
by following Linux & the CNCF in merely asking that a contributors'
commonly known identity, of their choosing, be used with the SoB line.

[1] Raised in many contexts at many times, but a decent overall summary
    can be read at https://drewdevault.com/2023/10/31/On-real-names.html
[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=d4563201f33a022fc0353033d9dfeb1606a88330
[3] https://github.com/cncf/foundation/blob/659fd32c86dc/dco-guidelines.md
[4] Excluding the rare GPG key signing parties for regular maintainers

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Acked-by: Stefan Hajnoczi <stefanha@redhat.com>
Acked-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Acked-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20241021190939.1482466-1-berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 docs/devel/submitting-a-patch.rst | 7 ++++++-
 .gitlab-ci.d/check-dco.py         | 5 ++++-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/docs/devel/submitting-a-patch.rst b/docs/devel/submitting-a-patch.rst
index 83e9092b8c..10b062eec2 100644
--- a/docs/devel/submitting-a-patch.rst
+++ b/docs/devel/submitting-a-patch.rst
@@ -18,7 +18,7 @@ one-shot fix, the bare minimum we ask is that:
 
    * - Check
      - Reason
-   * - Patches contain Signed-off-by: Real Name <author@email>
+   * - Patches contain Signed-off-by: Your Name <author@email>
      - States you are legally able to contribute the code. See :ref:`patch_emails_must_include_a_signed_off_by_line`
    * - Sent as patch emails to ``qemu-devel@nongnu.org``
      - The project uses an email list based workflow. See :ref:`submitting_your_patches`
@@ -335,6 +335,11 @@ include a "From:" line in the body of the email (different from your
 envelope From:) that will give credit to the correct author; but again,
 that author's Signed-off-by: line is mandatory, with the same spelling.
 
+The name used with "Signed-off-by" does not need to be your legal name,
+nor birth name, nor appear on any government ID. It is the identity you
+choose to be known by in the community, but should not be anonymous,
+nor misrepresent whom you are.
+
 There are various tooling options for automatically adding these tags
 include using ``git commit -s`` or ``git format-patch -s``. For more
 information see `SubmittingPatches 1.12
diff --git a/.gitlab-ci.d/check-dco.py b/.gitlab-ci.d/check-dco.py
index d221b16bd5..70dec7d6ee 100755
--- a/.gitlab-ci.d/check-dco.py
+++ b/.gitlab-ci.d/check-dco.py
@@ -78,7 +78,10 @@
 
 To indicate acceptance of the DCO every commit must have a tag
 
-  Signed-off-by: REAL NAME <EMAIL>
+  Signed-off-by: YOUR NAME <EMAIL>
+
+where "YOUR NAME" is your commonly known identity in the context
+of the community.
 
 This can be achieved by passing the "-s" flag to the "git commit" command.
 
-- 
2.39.5
