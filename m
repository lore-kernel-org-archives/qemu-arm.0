Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp1913770lfg;
        Mon, 23 Aug 2021 07:20:16 -0700 (PDT)
X-Received: by 2002:a63:3244:: with SMTP id y65mr32543176pgy.210.1629728416324;
        Mon, 23 Aug 2021 07:20:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629728416; cv=none;
        d=google.com; s=arc-20160816;
        b=C2dLYitwaimQnzgNuG02AlHimJPRTl9TRzsNAGQ7SGJGOmG7VQmLY9BRG8ZfofIq9W
         3WJa4/Ex6Bwqix3cJKo5oK35DKt49CZQG0HbGhHAq+PXztmAjh+RzMtvfLX9bhjSk4dN
         R2ar6YLNQQMd2+faHBG0tG4t5JJ4h2epTWxHTBD9VL2+0POcIhpqlZVIuik2rHKeoDyB
         SbP23kWV51ePL5JbDuz15J/qbyp9PWT96eQE8MD0PbtDBq7XAlfj3LK3uw02QWDxh2pZ
         Yz0hyjjBPuu/8z5BjGjk/vtcjO5MPQ1yXt9hYoNjuVPR/tvpqEDf5IU70FbBoS4FfT+2
         K4sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=YtVdB5C8k0Qzn5lswuYfPJliMBYCJcEkDDFKWLRRXxk=;
        b=0/m/l70x2SOuSDhC98mpNO1/pV0H60gxzuiK70cQNkcxESz6u9lX0cnGzb9jgu4lqV
         bcB+kuLDKaQN74rA6ASHtGKkL9OUgkFjJfQHIQzRiS2KMjeNL1S9Tkaeg1TIehJyg8H3
         R5k2Mab0H/eI5Cy7glGGGH2cxtjBlCaB71kiJxPsfOD9QGa7EsJTJAXVn4SgvWSNJ1L9
         hluD73rYO1NtxHfjL/e7rAG9MGEoUW050fpkiskQQzRZxRQaAUFx8Qv9CxwrSYgwU83E
         oIqYBgercHhNd8fMkAL+oMSRi1aMj5/j5vznABTHEfT2YTwd93Ln0X+dk2ufbLKfFZ0/
         IKBA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=Ye8D5U6D;
       spf=pass (google.com: domain of changbin.du@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=changbin.du@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <changbin.du@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id v5sor7375212pgj.80.2021.08.23.07.20.16
        (Google Transport Security);
        Mon, 23 Aug 2021 07:20:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of changbin.du@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=Ye8D5U6D;
       spf=pass (google.com: domain of changbin.du@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=changbin.du@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YtVdB5C8k0Qzn5lswuYfPJliMBYCJcEkDDFKWLRRXxk=;
        b=Ye8D5U6D5/t5pgn8Gw63JhzJjVgXCOEA1YSTznBGK+H2rtOL32awZ6ZuaYQK1US1/q
         Z2hrAodnKXxEsTk8bj81E+jbjsu/FRjT1BOyhKV493ZTxeCc0BXSl6oGbhGtZqV+JPUF
         5wflWMH9FSdBp5MfS0dTeLBMbTyXoLHrhvxJHV2FPhNr79PM6oqwbBgNl1h76lEz2rnl
         +WgdfkydDszopFrKzBcnKIUuUQaFvS0nwBuh/diZPLYrUaIhQCkE84Q3pq/A8KQNkMuT
         HO7tpuL6n03Yh0B9YM8O9KU9rxkAJ8u4p6B/ddrPDBfSQl5n+j4/VvAQrMncOPXoesy0
         a+bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YtVdB5C8k0Qzn5lswuYfPJliMBYCJcEkDDFKWLRRXxk=;
        b=LGgoY/2mQX7SnN5qxccEzkeJKzCq7o2yIjeyRSm2SFhW9/H019FrnOZAUH10VaBCBt
         8W5pI/5h2XMslxm2Pn4aVybBEdrQRtHdOjDH3Y5mtFbIul88Q51fHQWOQPPp9BdXaoMz
         4vlRoBttS0z77rKlTEuf1kX8qgdHrerv8x9sdWw8IieoIQzvbNV9J+/lHwe/zUJVouv2
         eMW85IQo3eZAcfWMJ9HhIJgkSN0mz+X5CyV57f9GXAXWl6QUDZ9AIj9YtE93igsGuP9A
         k3dX6dl9wBdokVVDshi9lbavWNqUJ8vtQzhisY2GFMUACyPFd4uJDOFuS8Ar25hrWrqM
         Fn6A==
X-Gm-Message-State: AOAM531qxym/bU53owGCay3ut5dtjAJ2Oq+gV66304wB8ZDi+1PKj9ZA
	NvY4n7Vfsbk2V41Eo++2ZjnB3u/OdEBJdQ==
X-Google-Smtp-Source: ABdhPJwx5C6+xoLc6Rx/A3CH5Udb3y4JB9pyG5tGPazxJZGawfLQsv049RKizHj9UDZ+PAujOJsduQ==
X-Received: by 2002:a63:a54f:: with SMTP id r15mr32298052pgu.212.1629728415703;
        Mon, 23 Aug 2021 07:20:15 -0700 (PDT)
Return-Path: <changbin.du@gmail.com>
Received: from WRT-WX9.. ([141.164.41.4])
        by smtp.gmail.com with ESMTPSA id ev12sm4700796pjb.57.2021.08.23.07.20.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Aug 2021 07:20:15 -0700 (PDT)
From: Changbin Du <changbin.du@gmail.com>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bin Meng <bin.meng@windriver.com>,
	qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org,
	Changbin Du <changbin.du@gmail.com>
Subject: [PATCH 0/3] gdbstub: add support for switchable endianness
Date: Mon, 23 Aug 2021 22:20:01 +0800
Message-Id: <20210823142004.17935-1-changbin.du@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: Bhd5iwiXfM5Q

To resolve the issue to debug switchable targets, this serias introduces
basic infrastructure for gdbstub and enable support for ARM and RISC-V
targets.

For example, now there is no problem to debug an big-enadian aarch64 target
on x86 host.

  $ qemu-system-aarch64 -gdb tcp::1234,endianness=big ...

Changbin Du (3):
  gdbstub: add basic infrastructure to support switchable endianness
  arm: gdbstub: add support for switchable endianness
  riscv: gdbstub: add support for switchable endianness

 configs/targets/aarch64-softmmu.mak |  1 +
 configs/targets/arm-softmmu.mak     |  1 +
 configs/targets/riscv32-softmmu.mak |  1 +
 configs/targets/riscv64-softmmu.mak |  1 +
 gdbstub.c                           | 11 +++++
 include/exec/gdbstub.h              | 72 +++++++++++++++++++++--------
 qemu-options.hx                     |  7 ++-
 softmmu/vl.c                        | 50 +++++++++++++++++++-
 target/arm/gdbstub.c                |  2 +-
 target/arm/gdbstub64.c              |  2 +-
 target/riscv/gdbstub.c              | 12 ++---
 11 files changed, 131 insertions(+), 29 deletions(-)

-- 
2.32.0
