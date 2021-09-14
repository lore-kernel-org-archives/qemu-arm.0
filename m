Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp735401lfp;
        Tue, 14 Sep 2021 07:26:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyyTS/sPDvW1Ko428x5XXvXQZoCN8FN0Duw0uYVAglYsKO6I+WjXXqjsjAl2Bu0ImbYhcQE
X-Received: by 2002:a05:6402:2156:: with SMTP id bq22mr7264054edb.49.1631629574823;
        Tue, 14 Sep 2021 07:26:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631629574; cv=none;
        d=google.com; s=arc-20160816;
        b=i/ZMBJOibcvo2JqoZdbqHMobBOIWF42jPo7IntE/M4UVCQ1OXZ5G+3j34ezVD623Vc
         Bi0goW9FV0PHOr34Pycc6KDjcgnl6uH8vp60Kcn4f6I8RV6RKJnMCJBCvMcaLX32uQd8
         DpfCoDHsJ6sDmvbykp2V30HQkDU9LF/WkW5GdhUbPCaWUVlYgzzmhJ8GLgNjxpXyF95Y
         Fo4BDweUXYjxjl0WV9BAlgqw0fTXDWzhNo5ebnT0B6NyDZNEJFrz9XVBhdgfwGVQ3flG
         f0o5vdR3BGc7aCqWfbyJLG9XQ/tn4MntFUlCwOO7rvZd93QH8d8EtNcrM8dd0NhFDrjw
         sTkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=u06VPRO3ZTpziCI9V80Mt31DearKqRpMuaMoaazZMng=;
        b=KqIDt1VsIsKwP7/w/u2G04/38dDStuFySw9cIwQRtihVltW5yZfz+BoZVT2dPu/abj
         mwXtvVx668XOcXr7uSZOMwfVWjNyvDe0A6utMiqfk4A4VrTfeqiglQUBvlAHu7PbAUSg
         GW+kOnxRTj5AQrP8263ya3ekTdJo3eSDthhKQ/TrFwAsxC7O4hy1iynXGe1TshiHwk9n
         86Bizp3XiDxdDkbQzXgubWUP7FI8/IUXJdwn+uHwRaZ8gBQQ2FblhcNjSvDTI36dWJst
         +iJMbkXWr4H0WN6L4l7jH6JS0cL6s1PWf4CfTWNl68FG8BspBdsro2QHVVyKz2lLz4Zr
         VAdQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=gPRKiAlM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p14si9856878ejn.419.2021.09.14.07.26.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Sep 2021 07:26:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=gPRKiAlM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mQ9O1-0007Pd-Qn
	for alex.bennee@linaro.org; Tue, 14 Sep 2021 10:26:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQ9KK-0000wh-2h
 for qemu-arm@nongnu.org; Tue, 14 Sep 2021 10:22:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31981)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQ9KH-0003vg-4p
 for qemu-arm@nongnu.org; Tue, 14 Sep 2021 10:22:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631629340;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u06VPRO3ZTpziCI9V80Mt31DearKqRpMuaMoaazZMng=;
 b=gPRKiAlMvO5LmshAFLi31sVbXc1/aet0HsgU5lyAEQceQgp86pR0dMbQDxGbjGwiIBc9L6
 lX02IMFIeEoGt/ORvC+3AOHlZVQJM4Oe6jThGV4bE0XgsCdro1YWj7s1PO63XbBw7FICMl
 Ab3jF5PsoHTDzz+UApzd+cOnt2i3hMg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-225-RMCR6vBXPDCSX-Pz2hmpwA-1; Tue, 14 Sep 2021 10:22:19 -0400
X-MC-Unique: RMCR6vBXPDCSX-Pz2hmpwA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BBBC4801E72;
 Tue, 14 Sep 2021 14:22:15 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.193.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 612D35D9CA;
 Tue, 14 Sep 2021 14:22:08 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 03/53] docs/devel: document expectations for QAPI data
 modelling for QMP
Date: Tue, 14 Sep 2021 15:19:52 +0100
Message-Id: <20210914142042.1655100-4-berrange@redhat.com>
In-Reply-To: <20210914142042.1655100-1-berrange@redhat.com>
References: <20210914142042.1655100-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Chris Wulff <crwulff@gmail.com>,
 David Hildenbrand <david@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Laurent Vivier <laurent@vivier.eu>, Max Filippov <jcmvbkbc@gmail.com>,
 Taylor Simpson <tsimpson@quicinc.com>,
 Alistair Francis <alistair.francis@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Eric Blake <eblake@redhat.com>, Marek Vasut <marex@denx.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Markus Armbruster <armbru@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stafford Horne <shorne@gmail.com>, David Gibson <david@gibson.dropbear.id.au>,
 qemu-riscv@nongnu.org, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uKJvf0ILXaOg

Traditionally we have required that newly added QMP commands will model
any returned data using fine grained QAPI types. This is good for
commands that are intended to be consumed by machines, where clear data
representation is very important. Commands that don't satisfy this have
generally been added to HMP only.

In effect the decision of whether to add a new command to QMP vs HMP has
been used as a proxy for the decision of whether the cost of designing a
fine grained QAPI type is justified by the potential benefits.

As a result the commands present in QMP and HMP are non-overlapping
sets, although HMP comamnds can be accessed indirectly via the QMP
command 'human-monitor-command'.

One of the downsides of 'human-monitor-command' is that the QEMU monitor
APIs remain tied into various internal parts of the QEMU code. For
example any exclusively HMP command will need to use 'monitor_printf'
to get data out. It would be desirable to be able to fully isolate the
monitor implementation from QEMU internals, however, this is only
possible if all commands are exclusively based on QAPI with direct
QMP exposure.

The way to achieve this desired end goal is to finese the requirements
for QMP command design. For cases where the output of a command is only
intended for human consumption, it is reasonable to want to simplify
the implementation by returning a plain string containing formatted
data instead of designing a fine grained QAPI data type. This can be
permitted if-and-only-if the command is exposed under the 'x-' name
prefix. This indicates that the command data format is liable to
future change and that it is not following QAPI design best practice.

The poster child example for this would be the 'info registers' HMP
command which returns printf formatted data representing CPU state.
This information varies enourmously across target architectures and
changes relatively frequently as new CPU features are implemented.
It is there as debugging data for human operators, and any machine
usage would treat it as an opaque blob. It is thus reasonable to
expose this in QMP as 'x-query-registers' returning a 'str' field.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 docs/devel/writing-monitor-commands.rst | 27 +++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/docs/devel/writing-monitor-commands.rst b/docs/devel/writing-monitor-commands.rst
index cddb36fb74..d68c552fdd 100644
--- a/docs/devel/writing-monitor-commands.rst
+++ b/docs/devel/writing-monitor-commands.rst
@@ -350,6 +350,33 @@ In this section we will focus on user defined types. Please, check the QAPI
 documentation for information about the other types.
 
 
+Modelling data in QAPI
+~~~~~~~~~~~~~~~~~~~~~~
+
+For a QMP command that to be considered stable and supported long term,
+there is a requirement returned data should be explicitly modelled
+using fine-grained QAPI types. As a general guide, a caller of the QMP
+command should never need to parse individual returned data fields. If
+a field appears to need parsing, then it should be split into separate
+fields corresponding to each distinct data item. This should be the
+common case for any new QMP command that is intended to be used by
+machines, as opposed to exclusively human operators.
+
+Some QMP commands, however, are only intended as ad hoc debugging aids
+for human operators. While they may return large amounts of formatted
+data, it is not expected that machines will need to parse the result.
+The overhead of defining a fine grained QAPI type for the data may not
+be justified by the potential benefit. In such cases, it is permitted
+to have a command return a simple string that contains formatted data,
+however, it is mandatory for the command to use the 'x-' name prefix.
+This indicates that the command is not guaranteed to be long term
+stable / liable to change in future and is not following QAPI design
+best practices. An example where this approach is taken is the QMP
+command "x-query-registers". This returns a formatted dump of the
+architecture specific CPU state. The way the data is formatted varies
+across QEMU targets, is liable to change over time, and is only
+intended to be consumed as an opaque string by machines.
+
 User Defined Types
 ~~~~~~~~~~~~~~~~~~
 
-- 
2.31.1

