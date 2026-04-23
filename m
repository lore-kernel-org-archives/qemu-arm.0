Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1E63FDEE55
	for <qemu-arm@archiver.kernel.org>; Thu, 23 Apr 2026 23:45:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wG3ip-0003SL-Hp; Thu, 23 Apr 2026 19:44:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucaaamaral@gmail.com>)
 id 1wG3im-0003RB-Mp
 for qemu-arm@nongnu.org; Thu, 23 Apr 2026 19:44:37 -0400
Received: from mail-dl1-x122d.google.com ([2607:f8b0:4864:20::122d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lucaaamaral@gmail.com>)
 id 1wG3ik-0007Bm-Fk
 for qemu-arm@nongnu.org; Thu, 23 Apr 2026 19:44:36 -0400
Received: by mail-dl1-x122d.google.com with SMTP id
 a92af1059eb24-12c565dd3a7so10502243c88.1
 for <qemu-arm@nongnu.org>; Thu, 23 Apr 2026 16:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1776987872; x=1777592672; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PT/MiBm6K41jh+luxV+cKAOP03DvqX25ef3U/FQC4Fs=;
 b=bmoHcpmQJv0woRVTnUWisXFqbgk6KcFGx8oUMToDXZTQEISc+wqj4zx8PQf57Gi4oF
 li9MSlshu0phjSbZj8AwyV4xg8Es2N5/GpzqwIOpU+bWA9BOcLDNs40aLad03Js8xk75
 20k0vVm1xUBNfNGykcwzqynP3fgL9prqDeOqdRY0Q13zUJKkXNwJHWBjKusqBvBlAgc6
 MZ+RAWyZMcHn6+cu7q63s8g+NMVTu7Z62V7JsGG0ZY757yHXqNJe5fDO64DmiwDF+n/R
 juLrdf+87d6Bg7qQZmKWL9ocPKep5HzuyV2+uawcaEMX8OIfwJt5zplqggn1RahGJ1yk
 kUEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776987872; x=1777592672;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=PT/MiBm6K41jh+luxV+cKAOP03DvqX25ef3U/FQC4Fs=;
 b=erqP1HAp1333aw8bwUKcoH0D0wigTG4ISF8Rm08z5yZkA/yXrcUhxH3tHU05TRL3t0
 /zPcFvzKpbpUytAeDBJDA94bCEJYGrP/FSU8Gb6rCEpLfUTebMBdBpf61ldNQAg35NNC
 zZHnDA58tRGpqcjVYSP78/J4ALbYJ+jXqs0kZ0Vhl9dpfM42m/zYLAvRYl8vW29H8dPs
 gNhJH0S2GqdFtMWYQDT0ebDTEf9VqGAhhRMJrq9lBBu62XCc7knP+Is5d4UCqJI4Yuk6
 pFOvRCyIOcOosvaMxQbnMf/CAdzIS3WO8nosczPfeReRC6x+MXCmtImXVK/OBs7tSpFe
 tziw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/uLe/KkxNjVxvG1xFNJ5gq6+fgWg7+rHTTs9cPuiGyOYMpncjnugzjKqHfX2GPqDpQbi3xlHVAiA==@nongnu.org
X-Gm-Message-State: AOJu0YwJgPSAlpmcFn42iU2KHtYhCnLTa0VAD2xwq9Dgohh+lvYlFVZt
 nDvKmzmprj9xpkQYRHaA5rRuut6YE3jyd7lkbTvJUwfWmSyl5KtyP+pj
X-Gm-Gg: AeBDiesTPWTUzTsEqerhbcsoVc87i8n/XHfKpj7l9i6x+p4C4jo9aI2irKBQRndgUwz
 Hl25biis/LOmhH/VVzSfl+s2w0gdGPyKQ6BV28zqwIX45RLRVllzKYYXEzTCZCoUIm41a3CPA7+
 KuDnKv8ppfSJK6hSGcHPJVXZSfQBC3KFspBxUnEzulIpDYjni1mAt4fSkoxe3V7V/nzK+wyB4wM
 F02SuC3+LQCrRzkZ1er2I6uzcALRpsr/9YpgMqy1UDNPlzx9RmKuhMWoFgyPVt8u+Hf0my7Bmd+
 Z7QK3IlrZmvN0LGFpw24O+nz7JGccBX4RGrxlcJcggCA+csANneVyJT96ui6LLIOEK8N2AsF/9S
 /n8tVGhNWSOheppErQW1wCNX8cIhPqJeokT8IEsr2RSDV17wrYkDz/uWFIPKzuzvrxIxdtZzevV
 qKsUIvksxkfFhuvPnUTdv85t1DgC0dHcJBFOUiAVkYpraQjwU250pE4PCiBhhUZ5lxNUZmUalq
X-Received: by 2002:a05:7022:eac8:b0:12c:2f8b:4c4d with SMTP id
 a92af1059eb24-12c73f7cbabmr17239478c88.15.1776987872200; 
 Thu, 23 Apr 2026 16:44:32 -0700 (PDT)
Received: from localhost.localdomain ([2804:7f4:c030:44a8:c4b9:45be:963d:f3a])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-12c7b62fe87sm26531612c88.2.2026.04.23.16.44.29
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 23 Apr 2026 16:44:31 -0700 (PDT)
From: Lucas Amaral <lucaaamaral@gmail.com>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Lucas Amaral <lucaaamaral@gmail.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, agraf@csgraf.de,
 mohamed@unpredictable.fr
Subject: Re: [PATCH v4 2/3] accel/hvf: introduce map granule abstraction and
 IPA property
Date: Thu, 23 Apr 2026 20:44:26 -0300
Message-ID: <20260423234426.7782-1-lucaaamaral@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <87h5p1wnzw.fsf@draig.linaro.org>
References: <20260317175744.32469-1-lucaaamaral@gmail.com>
 <20260317175744.32469-3-lucaaamaral@gmail.com>
 <87h5p1wnzw.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::122d;
 envelope-from=lucaaamaral@gmail.com; helo=mail-dl1-x122d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Hi Alex,

> There is a minor preference to use the glib functions here, g_strcmp0().

Will fix in v5, thanks.

Lucas

