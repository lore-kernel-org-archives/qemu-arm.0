Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp4539949lfg;
        Tue, 2 Mar 2021 07:00:36 -0800 (PST)
X-Received: by 2002:a50:e183:: with SMTP id k3mr21221964edl.45.1614697236130;
        Tue, 02 Mar 2021 07:00:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614697236; cv=none;
        d=google.com; s=arc-20160816;
        b=nncqMdx4XT8uoMJtJjACzCG2QMrpYWlBzlgDpwbf6kvWbHA6prP6Lt/t/qLExzkjBm
         usT4JybTrs1MXpz2nNQj9/IEw7RndJ6XFQozLsTywtHFc2ZQI18hrktn3D/6Ztw0KQT5
         2cdhdvXfqbYtBebCUxy0oI+ZYXxI+wzZ+nRZgmaNBKatl5J7CPk7GAMm5LMVVr/3vaJD
         hLSpyg+H3ENNC6uiZxEfOVm7tnChh6iRi7oLyxsQSS7zhaeJeL7b4umh4+nyvZIXJrq8
         y6UaJLjaiZM4fAnWW8eQSyZhv1Z39ijhErKVFEzlnhsrOUQExFK0z/BfojrmmSTyJRf3
         UsKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=BKerV/D4yrodfK5Y4jXpbSJ4FniyHeyLnN3PSysyF8Y=;
        b=Iu9Xe6a37w8EOvsBFHJDcikImsuitnLDJRibzzOg7uwxJPGIO6E6CJx1r8GIkXFHuI
         dBE3hQvtqhQpiQWPIraC8aICMK5GypGqxY6cfOVH56vYlOdAMvQyiCLPtcSAdJ1yVt+J
         2qYlbwdQpwe0JlSxK1j01TD3+s6PoHYQw1qXlCRieA1wlvx1lDgdGah7eEMQP8jEZuid
         iHO5m4MeJie4jMFiY+1TzP4OnGWCeBgOQtASD/WNpFvimNRn9hKrKQSU2CBcNrEJJ4vK
         XiMbGP1GbVn0C1mKggZKPzRF6L+09/RK1Bd6ldjFoJ7OTMp5HlUnG0LADwZ7mmmufmxB
         sHPA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=kMJ4BRTh;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id yk4sor5877698ejb.43.2021.03.02.07.00.35
        (Google Transport Security);
        Tue, 02 Mar 2021 07:00:36 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=kMJ4BRTh;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BKerV/D4yrodfK5Y4jXpbSJ4FniyHeyLnN3PSysyF8Y=;
        b=kMJ4BRTh216WsJvtpwLF9Q/JYYJMAxN/RnMYJEB28v42yYEMfCi1+F73iF0EulNk10
         7/byMCvtfp4uKTVybvY+WVO3cJ8+l5e9oij5b2MTY1Cmatr0y6Mg9c4usGvYlQibo/w5
         rncAxPnVMgL2/Fpfh1YbjDD2CSQxsfsPR5ZICmMI0227Q8Ssh91RmolTEMZOEvANYbnV
         ER1tqcNI2xm9Fgz/l+E0YxZbq5idig9AFmzulLjyFJJHq7DbwrCy1iHDKJXF6WAFe1tI
         9wCjPXmWtO9lkKCGYITJuZfHvEaP/MaykF1l7qjgrIuBbF7AbgsMDhPWixuKqXVuxkQj
         SgTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=BKerV/D4yrodfK5Y4jXpbSJ4FniyHeyLnN3PSysyF8Y=;
        b=fgw6CvSn6402dZ48zrH+Q3hpJ1/076TWo1YINuw/IItMn2BADvepnVK61WmDkGIAt1
         imoXKlpXBwjBoeUL6Zteo6nZU9IpS6larksws0w+5EEm2kQRk7jO3h266CRlQruyR5dn
         UWa5kg6CUicRLGbu1DcfaMJccfA6e1552YJEgQ8nYoI8dYHCcyLy+tJoQp1YPasuKANm
         w8VwUKZeCP9d3ebxggFl9twE0keJ91yYtAYxu+PCMje/N4tPtrApw8z2d7HZdsh+zE3c
         RlJZZ1aTIaXW8HMpxuncDDord/1vHPvl01/0J9W4/yvONkMto+gLcKzgqCs477yRo0W9
         WNLQ==
X-Gm-Message-State: AOAM533+IynXLtb/RVuOUxhiThieIK8Yl4I6LFwlNB2QoMaqQXE8Rz+e
	GqjKugCf/ad2uKVmhH+mW8Q=
X-Google-Smtp-Source: ABdhPJxxzAVZkhW4qSE2UIDQzizpVfmV8D6N4Y9vZCqMDEoygSHGBL6xNtZfG8RqIeFMECe388OMLg==
X-Received: by 2002:a17:906:503:: with SMTP id j3mr20942376eja.172.1614697233003;
        Tue, 02 Mar 2021 07:00:33 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net. [83.57.175.68])
        by smtp.gmail.com with ESMTPSA id i2sm19546374edy.72.2021.03.02.07.00.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Mar 2021 07:00:32 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
	qemu-arm@nongnu.org,
	Max Filippov <jcmvbkbc@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Michael Rolnik <mrolnik@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Laurent Vivier <laurent@vivier.eu>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Greg Kurz <groug@kaod.org>,
	Stafford Horne <shorne@gmail.com>,
	qemu-ppc@nongnu.org,
	Anthony Green <green@moxielogic.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Cornelia Huck <cohuck@redhat.com>,
	Claudio Fontana <cfontana@suse.de>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Michael Walle <michael@walle.cc>,
	Marek Vasut <marex@denx.de>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Chris Wulff <crwulff@gmail.com>,
	David Hildenbrand <david@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-s390x@nongnu.org,
	Sarah Harris <S.E.Harris@kent.ac.uk>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	qemu-riscv@nongnu.org,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Taylor Simpson <tsimpson@quicinc.com>
Subject: [PATCH v3 18/27] gdbstub: Remove watchpoint dead code in gdbserver_fork()
Date: Tue,  2 Mar 2021 15:58:09 +0100
Message-Id: <20210302145818.1161461-19-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210302145818.1161461-1-f4bug@amsat.org>
References: <20210302145818.1161461-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: dbcYcsuOfUNK

gdbserver_fork() is only used in user emulation where we can not
use watchpoints because we need the softmmu slow path to detect
accesses to watchpointed memory. This code doesn't do anything as
declared as stubs in "hw/core/cpu.h". Drop it.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 gdbstub.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/gdbstub.c b/gdbstub.c
index 759bb00bcf0..eee4301b5e6 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -3349,7 +3349,6 @@ void gdbserver_fork(CPUState *cpu)
     close(gdbserver_state.fd);
     gdbserver_state.fd = -1;
     cpu_breakpoint_remove_all(cpu, BP_GDB);
-    cpu_watchpoint_remove_all(cpu, BP_GDB);
 }
 #else
 static int gdb_chr_can_receive(void *opaque)
-- 
2.26.2
