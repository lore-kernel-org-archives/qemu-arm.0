Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp451533lfg;
        Fri, 7 May 2021 07:44:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx0SUcmqEIN60YKsyOk/B+uaJFsEa/nxAnDb1y+xfp6qAr49mwsV1hIF1qDrWtLZoUTIV8x
X-Received: by 2002:a05:6402:10cd:: with SMTP id p13mr11842977edu.382.1620398658796;
        Fri, 07 May 2021 07:44:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620398658; cv=none;
        d=google.com; s=arc-20160816;
        b=VG9lEDIq05iW80RoSm1WOSetGeuumB51ueHA0e7P8Ro/wmefZbZhGvwVFAMJ5dXaj4
         i+X4qDz+6gxqal272dLr1Kov8k9AX+D363/SHqgLSegqEGNZk0mz3J5IkQlbva2Fxykh
         r2F1I+Ve/IwGNM3XG0Hz7uW1jOfg1N0ZvJRP7I9SjjsyH+Uagj1jEsQcB+GYhji+xPnU
         s9r/V28Nd41OmUFCiSHTfX+HRQunCCaOybi21evKUj+S1xjzRwamgIVcRxikPAIx2eYq
         1iTKd+lak1PzcKUO+iPmew3G27x7bclkBYX8De+5ETcpGQzsXqVWTNj2NIOhPTfT89Q3
         TayQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=B3vDcPc2Lwo5z0s8ItWutJUQDssHj4SCpM1PcCRAn5U=;
        b=HuKMedrNDtWvNXwhifqo/ByeYRJh0DHh9Xau/lwvDbcF6bVFQXgfB2tcTLXBh9v6kq
         8Aa489oIXyxbODpob2KdobjJaXkXJ5zY6ZIhI655HAWQoMHToVYVD13u8zX5tiaQS6XZ
         sgg/j9/xwVEXIpaOxT+p1lYdRuicnFqlKjVQd+5QypPD/OipKWyLTVWXA+D1f+33XUSA
         ROQ07sfQgB4jpmNoDj8sIhgi6jg86/bVzEk4G7iMacSoDsgVfrGcyzu6jzvtoF39xt8F
         sMdZNSgF84eZzf/x1RDb+RfNcIhzEH6sep6vhGdDmJBSY/BFNCK0TGjWl9fUrNZiQP83
         36gg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Dt46niDF;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id r21si6319783ejo.341.2021.05.07.07.44.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 May 2021 07:44:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Dt46niDF;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1620398657;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B3vDcPc2Lwo5z0s8ItWutJUQDssHj4SCpM1PcCRAn5U=;
	b=Dt46niDFld6lbPOre/2refLkrp2sAnAxAXyAHzJSCkAZOoRf2MGYgHWkidgcr7OrN8qseo
	qY6yeY3gASGpIed+A8K44pc/lNnojw5PTOw//9aY4Q+yXc5YIftpaRhnzVtWx8mKcPEWpb
	FInXrNHnIipVA0H5bOzQLke13KcizPk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-293-YMKDMK5EOyO_ijmJZ7ffqQ-1; Fri, 07 May 2021 10:44:16 -0400
X-MC-Unique: YMKDMK5EOyO_ijmJZ7ffqQ-1
Received: by mail-wm1-f70.google.com with SMTP id n24-20020a7bcbd80000b029014287841063so2328023wmi.3
        for <alex.bennee@linaro.org>; Fri, 07 May 2021 07:44:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=B3vDcPc2Lwo5z0s8ItWutJUQDssHj4SCpM1PcCRAn5U=;
        b=oQ85vDX7JgIHTuq2EKD04sblVbbE67KM2Pj2rVrNWmVOQifECUvRbHeB9ZicgdB2vX
         bgmIjm5JQFSKshBZa4cS1+VCGEB2BZfX9iGoOjHCRuvoydzp3B4DLBxF2c4QXKQJtfbJ
         Az7RtRIr/6Co7NV1tvATKt2DC2GFADgH/xex+awQJrX/pPDAylWsKZzgJ3Cn/IEG1OKD
         6nSYeGJ+zQcnFta+5bLCWdydNzA6REPukAn3V1HRo5M9oK48UpTB0HP3b6Fl/dtF2De0
         n/1VGAq8fwQe/x4Jlck2+nPQdz29txkYpV6qSN6v3diQAjfjoi/WnOCTF2uSgo5jHlbb
         MQPQ==
X-Gm-Message-State: AOAM531cD6KQJbZpWeUnFnZuaMK6Krd0s/GQWmnGITh/53S/j9dPRrz7
	2zkaFe6sDecqmPO8sjcmHoYqSWk5vS/BJFnbLlVZiCqh7dK3WFqC3aZiRH+BJ3T5+m3S4FUHukh
	ZMDFRbVWLMbORWQaP
X-Received: by 2002:a7b:cc15:: with SMTP id f21mr21011233wmh.86.1620398655113;
        Fri, 07 May 2021 07:44:15 -0700 (PDT)
X-Received: by 2002:a7b:cc15:: with SMTP id f21mr21011214wmh.86.1620398654950;
        Fri, 07 May 2021 07:44:14 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from localhost.localdomain (astrasbourg-652-1-219-60.w90-40.abo.wanadoo.fr. [90.40.114.60])
        by smtp.gmail.com with ESMTPSA id r5sm7924795wmh.23.2021.05.07.07.44.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 May 2021 07:44:14 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-ppc@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Gerd Hoffmann <kraxel@redhat.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v3 12/17] gdbstub: Constify GdbCmdParseEntry
Date: Fri,  7 May 2021 16:43:10 +0200
Message-Id: <20210507144315.1994337-13-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210507144315.1994337-1-philmd@redhat.com>
References: <20210507144315.1994337-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: vISD2sMhGm9c

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 gdbstub.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/gdbstub.c b/gdbstub.c
index 9103ffc9028..83d47c67325 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -1981,7 +1981,7 @@ static void handle_v_kill(GdbCmdContext *gdb_ctx, void *user_ctx)
     exit(0);
 }
 
-static GdbCmdParseEntry gdb_v_commands_table[] = {
+static const GdbCmdParseEntry gdb_v_commands_table[] = {
     /* Order is important if has same prefix */
     {
         .handler = handle_v_cont_query,
@@ -2324,7 +2324,7 @@ static void handle_set_qemu_phy_mem_mode(GdbCmdContext *gdb_ctx, void *user_ctx)
 }
 #endif
 
-static GdbCmdParseEntry gdb_gen_query_set_common_table[] = {
+static const GdbCmdParseEntry gdb_gen_query_set_common_table[] = {
     /* Order is important if has same prefix */
     {
         .handler = handle_query_qemu_sstepbits,
@@ -2342,7 +2342,7 @@ static GdbCmdParseEntry gdb_gen_query_set_common_table[] = {
     },
 };
 
-static GdbCmdParseEntry gdb_gen_query_table[] = {
+static const GdbCmdParseEntry gdb_gen_query_table[] = {
     {
         .handler = handle_query_curr_tid,
         .cmd = "C",
@@ -2420,7 +2420,7 @@ static GdbCmdParseEntry gdb_gen_query_table[] = {
 #endif
 };
 
-static GdbCmdParseEntry gdb_gen_set_table[] = {
+static const GdbCmdParseEntry gdb_gen_set_table[] = {
     /* Order is important if has same prefix */
     {
         .handler = handle_set_qemu_sstep,
-- 
2.26.3
