Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp2583259lfk;
        Sat, 11 Dec 2021 11:11:37 -0800 (PST)
X-Received: by 2002:adf:d0d0:: with SMTP id z16mr22535210wrh.601.1639249897627;
        Sat, 11 Dec 2021 11:11:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639249897; cv=none;
        d=google.com; s=arc-20160816;
        b=Q7+qeqIizhAnhcTTNJS+3AgDxigUbYGicsm03ohKvx71eDLVrGMNo4XRyb5uAJouMs
         AyyigVtXHd7rzgKMvCPYh6eSVqr5MuVo7TpIkMm04VlfCtPUMobyd94y1SnuJ7OXRIwY
         bikeXWKJSOa3tBHCI9MY8gK6Fi7rDQ/3UaTWCLaPSQ+18/Y4yOQeKE36j8RionW/X3gF
         eYFUygry581/NSLKYITRxcapelaTUHxH9utVq5N8SBIwIyBtPzlbDoCpt5tSacHEUTh+
         Emmd6PZUZdRy9xwoR7eFYD2vRrQ48ZOaWEPYlvh5Gzxr221lkKg7ZUnKTduCoDxn5cc0
         lmWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=cuhfcvbNslP1KgGtCCb2Ywd3Kea4YuO6J6/VQuuwaJ8=;
        b=EYnueCT+mK8LcqhEL1QD+vuFUURtbaHbEkv8RLtc2LPXLdaMWCLSCyL5F77/PBFOMd
         5X+hEm8SITMPDmI9FZyY2rXuHD3rarKDcf79bZL2caE4qFh8mUDpuw33qt7Bq4gjzJ81
         nQ/A68TeaBctKwVhGc9ezPKJ0rVXLh4cHdXrmHTZaI1zzDPdi7Zkz+K10stZmSc65ybr
         mS6gOFFnH8LsH+r14YOvFYFc3H9uI8LL7tfm9k6IldqfiRjyXawcrhUUvEz4S7ydum99
         OCPwsbcHvEnNywCpCXJBKZCBLWEmM7HCrNVkTJU0BG0xeSf4jf0IWmYxStgiIm+88Vh6
         BFDw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=e5uBigth;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 62sor4242248wrm.39.2021.12.11.11.11.37
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 11 Dec 2021 11:11:37 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=e5uBigth;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cuhfcvbNslP1KgGtCCb2Ywd3Kea4YuO6J6/VQuuwaJ8=;
        b=e5uBigthB06gVS6pBXbsmtW2DOlF7Az0FJsz5VNlu5Ze/5FgjhiMdRJ9I68VNgXnWa
         HyBrfjW7CJEWDXOtGUFJOY8gmnRlJhYYSoas7IeDur13gliU8JBjmyHOff/pDzOqqdBV
         tBxNP5+9vxg10E4dnigVVmbqhWCXilzK7SjK+Zi50YSuEOEuNdoKTqmEpY0xMPz3CxXU
         ECvd/k71fKIFIGT4aCG74zDwMQtpcaLM37aU3OI+65B2zWzAaWeRNS0ZvyJx4SFif4H3
         iLtFWXVPT1gK3wgt86WmG0mexLavLahR+rWHd32k1IWZKQywcLWfyGS6Kz8P6ZPWB8N0
         A4Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cuhfcvbNslP1KgGtCCb2Ywd3Kea4YuO6J6/VQuuwaJ8=;
        b=PrPFA1QKy9y76D0YUW20VcjWAOPX53TAHtgEJrkHMkwfIc/vCQ3Ck3y8hqoYxQdcY1
         D6/AQXG0FzT070Bw4qMApuwQO+17OUz9M/Fitl8gKdC384m1u2YmYo4bZyjd6FKgl+qx
         Qrh4IFkhDuG7IQf/hJiAJyenDmiGvyDo9+U81fDUlLOayZKC3v4ZjCwq/jEgVnLcTx7e
         blpl3sUROfub7pK74SOItmSwaO3L+EdpgytdvhZChzriiIcOIjaV8JEWoZ9ehmc00D19
         k2KSknhgoVs31CshzRtTdxqqhtBmojwgVnYWWUaf003b1kWALxiYT6HHmQCb9T4FyGL+
         Q+cw==
X-Gm-Message-State: AOAM531/W0oPgIJ5zvGd1PnEZKCe36++XMQvSxJc9rKJqm7NyEwT/50k
	AND4qiSIo+WxIIchpfHFcmUom15i
X-Google-Smtp-Source: ABdhPJweQZCtZCRk+rhAyjtuyqC5qn9rWK8caQGjnRA2IMtmi9GsgCiHcU0tvVy9ieCbwFFNlvlROA==
X-Received: by 2002:a05:6000:2c2:: with SMTP id o2mr21790673wry.360.1639249896986;
        Sat, 11 Dec 2021 11:11:36 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id m20sm2205300wmq.11.2021.12.11.11.11.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Dec 2021 11:11:36 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Shashi Mallela <shashi.mallela@linaro.org>
Subject: [PATCH 00/26] arm gicv3 ITS: Various bug fixes and refactorings
Date: Sat, 11 Dec 2021 19:11:09 +0000
Message-Id: <20211211191135.1764649-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 6F88wovmv6+K

I've been working on the ITS to add support for the GICv4 functionality.
In the course of that I found a handful of bugs in it and also some
places where the code benefited from refactoring to make it a better
base to put in the GICv4 parts. This patchset is just the bugfixes
and cleanups, because there are enough patches here that I figured it
made sense to send them out now rather than holding on to them.
I've included Alex's "clean up error reporting" patch as patch 1 in
the series to avoid having to use a Based-on: tag.

Bug fixes:
 * Most of the bounds checks on values provided by the guest in
   command packets had off-by-one errors. In almost all cases this
   was completely harmless since the tables being indexed are in
   guest memory, but for rdbase we use it as an index into a C array,
   so there a badly-behaved guest could probably crash QEMU
 * the loop over the GITS_BASER<n> registers in extract_table_params()
   returned early when it found a register with the Valid bit clear,
   rather than continuing to process the other base registers
 * We miscalculated the entry sizes for the Collection and Device
   tables, with the effect that we could potentially corrupt
   guest memory
 * the MAPI command handling was missing an error check on EventID
 * if the guest confgured a DTE with a size of 32 we would have
   shifted off the end of a 32-bit value
 * the calls to process_its_cmd() put the return value in the wrong
   variable
 * if the memory access to read the first word of the command packet
   failed, our error-handling codepath wasn't quite right
 * we weren't actually implementing the "memory access errors cause
   the ITS to stall command processing, parameter errors cause it
   to continue to the next command" logic that the comments claim

Refactorings:
 * the ITS_CTLR_ENABLED define was a duplicate of R_GITS_CTLR_ENABLED_MASK
 * extract_table_params() had unnecessarily duplicated code for
   handling each table type
 * some refactoring and renaming of variables and struct fields used
   in the bounds-check tests so that we have a consistent convention
   that hopefully reduces the risk of future off-by-one errors
 * some parts of the code which were doing open-coded shift-and-mask
   operations have been converted to use the FIELD macro
 * the code for "find the address of an entry in an in-guest-memory
   table" can be factored out into its own function

thanks
-- PMM

Alex Bennée (1):
  hw/intc: clean-up error reporting for failed ITS cmd

Peter Maydell (25):
  hw/intc/arm_gicv3_its: Correct off-by-one bounds check on rdbase
  hw/intc/arm_gicv3_its: Remove redundant ITS_CTLR_ENABLED define
  hw/intc/arm_gicv3_its: Remove maxids union from TableDesc
  hw/intc/arm_gicv3_its: Don't return early in extract_table_params()
    loop
  hw/intc/arm_gicv3_its: Reduce code duplication in
    extract_table_params()
  hw/intc/arm_gicv3_its: Correct setting of TableDesc entry_sz
  hw/intc/arm_gicv3_its: Don't misuse GITS_TYPE_PHYSICAL define
  hw/intc/arm_gicv3_its: Correct handling of MAPI
  hw/intc/arm_gicv3_its: Use FIELD macros for DTEs
  hw/intc/arm_gicv3_its: Use 1ULL when shifting by (DTE.SIZE + 1)
  hw/intc/arm_gicv3_its: Correct comment about CTE RDBase field size
  hw/intc/arm_gicv3_its: Use FIELD macros for CTEs
  hw/intc/arm_gicv3_its: Fix various off-by-one errors
  hw/intc/arm_gicv3_its: Rename max_l2_entries to num_l2_entries
  hw/intc/arm_gicv3_its: Fix event ID bounds checks
  hw/intc/arm_gicv3_its: Convert int ID check to num_intids convention
  hw/intc/arm_gicv3_its: Fix handling of process_its_cmd() return value
  hw/intc/arm_gicv3_its: Don't use data if reading command failed
  hw/intc/arm_gicv3_its: Use enum for return value of process_*
    functions
  hw/intc/arm_gicv3_its: Fix return codes in process_its_cmd()
  hw/intc/arm_gicv3_its: Refactor process_its_cmd() to reduce nesting
  hw/intc/arm_gicv3_its: Fix return codes in process_mapti()
  hw/intc/arm_gicv3_its: Fix return codes in process_mapc()
  hw/intc/arm_gicv3_its: Fix return codes in process_mapd()
  hw/intc/arm_gicv3_its: Factor out "find address of table entry" code

 hw/intc/gicv3_internal.h               |  40 +-
 include/hw/intc/arm_gicv3_its_common.h |   9 +-
 hw/intc/arm_gicv3_its.c                | 628 +++++++++++--------------
 3 files changed, 303 insertions(+), 374 deletions(-)

-- 
2.25.1
