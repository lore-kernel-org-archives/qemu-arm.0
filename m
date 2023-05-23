Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2058116ejb;
        Tue, 23 May 2023 11:05:56 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6j2FnN5Of1KwtttIU2jT4zjYybCG5BWHxsR6GR3wOxNAooWUuyZnQVeEbOipZ+/DzgDQZ9
X-Received: by 2002:a05:6214:230c:b0:625:7fbc:d23f with SMTP id gc12-20020a056214230c00b006257fbcd23fmr12966384qvb.34.1684865156249;
        Tue, 23 May 2023 11:05:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684865156; cv=none;
        d=google.com; s=arc-20160816;
        b=itGuQxsBOtsH36voMilaLSMCCdxJsw+Srm8ad8V/PH9tuuERtFWjrXdsqbtKugBfNU
         cGlICXano5iC+w302D6LV2LjSjkX8XNo1LRF+MPzPlEB3jZPYXCZToKrDecjWWRIHPud
         x0JXDpszBlS9ZBchHsX0ukmhRnl36KmWWkW5/q8BOh/RiqUQ0A2kO1vE5SaeLwKDnVwi
         w0Ypie4C7qfDHWrzkgR41fUuciwVGv6eje2JzH0V8XKQ5rLVeiTyacY9tlmUSrn+1E8x
         riB5RqXuGQh+ycSDUPCMyBTxSTmQGj53OQdpjsdeTW134sHSzWlmvmBnRM8xZTeJSmG/
         KiWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature
         :dkim-signature;
        bh=Rubn4y2VxTZNjvxZ18t8B1AWaqKVCWyagyFyjHMSmSc=;
        b=Vlws5CZQ81zLLWACh+Ush5xjrRwV8Ff+k6UgdRDI0Z9ZV0te1rYbImWcm1nUxjBZ/k
         sUDrQiRDPI8cMmqCbtKwrMATohDCVmBA5Jf0HXDmNBay9pUqTq0UeVS96VtkKZRWrZqU
         pAW5MtkgVuN+HrxrpFZ0cMQOc+n5ez/AuB/tW7ksuv0b+96BVRV/kVsHcD2OZlndxE/L
         EaD5zOKDCL9+sGqtaEaFaKtcudANcpaDg4o5zeS99sgbpbt+GD6MBHY+r/mj1eAJVP+r
         GaFkaNeKMOHu/44h359VRh4Fhi2M1SVUQCGaP8SKRN5Zz1Y/xlmZWXsoS2MD8cKhENMl
         64LA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=NVms8bxI;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=dY0hX6eG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u12-20020ad45aac000000b00624d4b91562si5065711qvg.290.2023.05.23.11.05.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 May 2023 11:05:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=NVms8bxI;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=dY0hX6eG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q1WO8-0006q8-NH; Tue, 23 May 2023 14:05:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1q1WO6-0006pC-7J; Tue, 23 May 2023 14:05:35 -0400
Received: from smtp-out1.suse.de ([195.135.220.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1q1WO4-0007Qa-Ki; Tue, 23 May 2023 14:05:33 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E6A51228C4;
 Tue, 23 May 2023 18:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1684865129; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Rubn4y2VxTZNjvxZ18t8B1AWaqKVCWyagyFyjHMSmSc=;
 b=NVms8bxItmMKnIIWADhXkRxe2at3DC3jGxM+sWTvU1d4jSj3ghjdWgOoA8S4mTx+tKDYvz
 7OozPhMDPFylja1ZSqYGYI++rawrnyvVaCq4FpY6dw3VBHYTuvQSXlyDgFh4KRXxgfxAtu
 Y1HQpczbzQGd5R8ucBZ2pU2RD3vpSo4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1684865129;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Rubn4y2VxTZNjvxZ18t8B1AWaqKVCWyagyFyjHMSmSc=;
 b=dY0hX6eGPhwaYIGunKSGcKyLvLVSaNX8TBVCzfBs3uUCpA4gjNSQawiXWCLYJOpCvqN0xF
 Gv6xZBXW1YQ60eAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1B6FE13A10;
 Tue, 23 May 2023 18:05:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Ze8GNWcAbWQMQwAAMHmgww
 (envelope-from <farosas@suse.de>); Tue, 23 May 2023 18:05:27 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: [PATCH 0/3] arm/Kconfig: Some convenience changes
Date: Tue, 23 May 2023 15:05:22 -0300
Message-Id: <20230523180525.29994-1-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=farosas@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: LevWcQiLBEK5

Hi,

These are some changes that people asked for/suggested during the
review of previous Kconfig series that I haven't had an opportunity to
prepare until now.

CI run: https://gitlab.com/farosas/qemu/-/pipelines/876384304

Fabiano Rosas (3):
  target/arm: Explain why we need to select ARM_V7M
  arm/Kconfig: Keep Kconfig default entries in default.mak as
    documentation
  arm/Kconfig: Make TCG dependence explicit

 configs/devices/aarch64-softmmu/default.mak |   6 +
 configs/devices/arm-softmmu/default.mak     |  40 +++++++
 hw/arm/Kconfig                              | 123 +++++++++++++-------
 target/arm/Kconfig                          |   3 +
 4 files changed, 131 insertions(+), 41 deletions(-)

-- 
2.35.3

