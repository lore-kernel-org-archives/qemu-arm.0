Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp2099845ejb;
        Mon, 20 Feb 2023 01:16:01 -0800 (PST)
X-Received: by 2002:a05:600c:1652:b0:3e0:ffd4:bfb2 with SMTP id o18-20020a05600c165200b003e0ffd4bfb2mr427998wmn.4.1676884561148;
        Mon, 20 Feb 2023 01:16:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676884561; cv=none;
        d=google.com; s=arc-20160816;
        b=ZDZp7kKWL+dDHfsPVY6auL+sqzrwdWoY/CFZzDyvky4g4pPMziFoGcHcdbEzicBEiH
         8tipLpgtNVV4nleDB88vut99HNetsUsIZ8Q6Hswc87PpiAj3u1c1aU7de+1ZR7pWgITV
         urf1BF+F3zq5ZlNoczSehJUw/UXOZztsWL7V1XXevCTBxodXVgue4cp7aLLMEbr+Hilv
         mln6OY9PBw5z3fut35nMc3rPtfdAknzF4kgyecSDtmnkx/6AJkMp2OTStImhD/AJmVAA
         dpic270tpq12tIscbhXqsqlQWsxUIcq3otuqbtf9j7vCzUKQBVsnOhwhskn7tcFbpAjl
         Ofsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=jeXuk3DN5Mx4yuY9/PXaV3cLllgNC2UqEL9auJG1ah4=;
        b=EhilBUglK2Q92L9XlgD+vR8vVwJ4xX8xSJEDVGYlUmGlN43QEA8qAdM5uMp3C5LLpe
         IOnV+rftMDY2bleoln4us17PXpOjC+lOsU6lQHRSx5ZEhACvl27Yjzw8aiU+Mm4roghg
         rhLc4mVdt7JF8fKv9pL+9ucO9XOWUBQMVgUxiVrnoW+IiUsk1g4Vr/v6ncsY/SdvlFCO
         2t/BeL1Y+deBhGUKM8ytgFnPjJzOon81xtxLUVDkO8sb5x44nrJUCItqs5YinpJyX+Tx
         mesd4xgIA8EAJJviN6nFGEGa5CI7mdEH3fTyAZxyygttEtFwFOiymljQmEmw6yM+yF+A
         PBLQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=X9HI8cuK;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id o10-20020a1c750a000000b003dc46388648sor24218wmc.42.2023.02.20.01.16.01
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 20 Feb 2023 01:16:01 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=X9HI8cuK;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jeXuk3DN5Mx4yuY9/PXaV3cLllgNC2UqEL9auJG1ah4=;
        b=X9HI8cuKVoc6cu7Gy/gd0haTMRShy2N0X6gMidIQHR+XvCNefLGAOjD2DoeYj6tURQ
         SuH5B2BqI9h3Yncex8mygXrjRLxzVGKJK1uaxwS3C+/EOAQZntxDApkjaBy2+kFm3zuY
         6tgr8/NeeTG8RfYV4LD+hUK/EvRctLyFUj6w2dICzyrce0LbbrF/IJ57iHPdjR+4b+gk
         SGFuFwSj6x5YmUW3yKsojCUJt3F4bwIxuvY2Sg1O7AYGqSgFEBN3oqCrM+8FCrar7Z1Z
         vJGM2kOTRw1Xmkun6xa+K3Hxdo7VqSAZJicduCAxIq9p6H8+B+jkuiuBijw50TEAIZBq
         lvjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jeXuk3DN5Mx4yuY9/PXaV3cLllgNC2UqEL9auJG1ah4=;
        b=HPPlXHpWWKAhMPMNrSZFqvjeqUyxXS1aba2V/UfIlwo6/NQakyeIz/aEInBCdz6uz7
         czilN4a4opJdCQ2+a0Kofpkhkm5dp4xdi9mfKvhDMRVXVLVWOmglBYcuygl77g+y5WB8
         pFRPbbbEODBFQlrObHWH9D5I9ir0sgeH6KgxBDj0uc5ZryuAGBC7XslV3v6wRMPTOnmF
         k99G77GWGlD33ZM9IcEXym5wlxc7sk6hKsorbISrsC4mjZDJPac0QN8Z3witLWEV2Nnb
         3uOuvZT6fSAgbrfWfB+nYwTOmo6cc0K2cp/ElaJOBTOd1Rw0mGd0z5rnkbyamUy+ZqXj
         1VCg==
X-Gm-Message-State: AO0yUKVhUjJXlvCdk8RWEM30WnOi9Jd++UIho8Oe/iHc9+1wofC2xtGh
	wpUwZhFdbfeVzuc0z3yc7zYS4/JQY9PBtdV8mVs=
X-Google-Smtp-Source: AK7set+EGk4RIxEK3u8rvk4rYNXk/VvC9GfsIIBZ07UHPXuFDZWcrs2zIi6feXHhDMfzIvBHlcM67Q==
X-Received: by 2002:a05:600c:984:b0:3e1:fff7:e970 with SMTP id w4-20020a05600c098400b003e1fff7e970mr82721wmp.30.1676884560915;
        Mon, 20 Feb 2023 01:16:00 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id n9-20020a05600c500900b003daffc2ecdesm9573572wmr.13.2023.02.20.01.15.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 20 Feb 2023 01:16:00 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org,
	John Snow <jsnow@redhat.com>,
	qemu-block@nongnu.org,
	qemu-arm@nongnu.org,
	Fiona Ebner <f.ebner@proxmox.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 24/24] hw/ide/ahci: trace ncq write command as write instead of read
Date: Mon, 20 Feb 2023 10:13:58 +0100
Message-Id: <20230220091358.17038-25-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230220091358.17038-1-philmd@linaro.org>
References: <20230220091358.17038-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 6IeWBbsgmC16

From: Fiona Ebner <f.ebner@proxmox.com>

Fixes: e4baa9f00b ("AHCI: Replace DPRINTF with trace-events")
Signed-off-by: Fiona Ebner <f.ebner@proxmox.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: John Snow <jsnow@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230217103130.42077-1-f.ebner@proxmox.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/ide/ahci.c       | 4 ++--
 hw/ide/trace-events | 1 +
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/ide/ahci.c b/hw/ide/ahci.c
index d79b70d8c5..55902e1df7 100644
--- a/hw/ide/ahci.c
+++ b/hw/ide/ahci.c
@@ -1086,8 +1086,8 @@ static void execute_ncq_command(NCQTransferState *ncq_tfs)
                                       ncq_cb, ncq_tfs);
         break;
     case WRITE_FPDMA_QUEUED:
-        trace_execute_ncq_command_read(ad->hba, port, ncq_tfs->tag,
-                                       ncq_tfs->sector_count, ncq_tfs->lba);
+        trace_execute_ncq_command_write(ad->hba, port, ncq_tfs->tag,
+                                        ncq_tfs->sector_count, ncq_tfs->lba);
         dma_acct_start(ide_state->blk, &ncq_tfs->acct,
                        &ncq_tfs->sglist, BLOCK_ACCT_WRITE);
         ncq_tfs->aiocb = dma_blk_write(ide_state->blk, &ncq_tfs->sglist,
diff --git a/hw/ide/trace-events b/hw/ide/trace-events
index a394c05710..57042cafdd 100644
--- a/hw/ide/trace-events
+++ b/hw/ide/trace-events
@@ -91,6 +91,7 @@ ahci_populate_sglist_short_map(void *s, int port) "ahci(%p)[%d]: mapped less tha
 ahci_populate_sglist_bad_offset(void *s, int port, int off_idx, int64_t off_pos) "ahci(%p)[%d]: Incorrect offset! off_idx: %d, off_pos: %"PRId64
 ncq_finish(void *s, int port, uint8_t tag) "ahci(%p)[%d][tag:%d]: NCQ transfer finished"
 execute_ncq_command_read(void *s, int port, uint8_t tag, int count, int64_t lba) "ahci(%p)[%d][tag:%d]: NCQ reading %d sectors from LBA %"PRId64
+execute_ncq_command_write(void *s, int port, uint8_t tag, int count, int64_t lba) "ahci(%p)[%d][tag:%d]: NCQ writing %d sectors to LBA %"PRId64
 execute_ncq_command_unsup(void *s, int port, uint8_t tag, uint8_t cmd) "ahci(%p)[%d][tag:%d]: error: unsupported NCQ command (0x%02x) received"
 process_ncq_command_mismatch(void *s, int port, uint8_t tag, uint8_t slot) "ahci(%p)[%d][tag:%d]: Warning: NCQ slot (%d) did not match the given tag"
 process_ncq_command_aux(void *s, int port, uint8_t tag) "ahci(%p)[%d][tag:%d]: Warn: Attempt to use NCQ auxiliary fields"
-- 
2.38.1
