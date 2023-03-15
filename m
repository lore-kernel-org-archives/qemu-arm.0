Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id r6-20020a05600c458600b003ebff290a52sm2868114wmo.28.2023.03.15.10.49.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 10:49:20 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 36CF21FFD5;
	Wed, 15 Mar 2023 17:43:45 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Akihiko Odaki <akihiko.odaki@gmail.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu-riscv@nongnu.org,
	Riku Voipio <riku.voipio@iki.fi>,
	Igor Mammedov <imammedo@redhat.com>,
	Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
	Thomas Huth <thuth@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Hao Wu <wuhaotsh@google.com>,
	Cleber Rosa <crosa@redhat.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Jan Kiszka <jan.kiszka@web.de>,
	Aurelien Jarno <aurelien@aurel32.net>,
	qemu-arm@nongnu.org,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	qemu-ppc@nongnu.org,
	Juan Quintela <quintela@redhat.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Darren Kenny <darren.kenny@oracle.com>,
	kvm@vger.kernel.org,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Stafford Horne <shorne@gmail.com>,
	Weiwei Li <liweiwei@iscas.ac.cn>,
	Sunil V L <sunilvl@ventanamicro.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Thomas Huth <huth@tuxfamily.org>,
	Vijai Kumar K <vijai@behindbytes.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Song Gao <gaosong@loongson.cn>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Niek Linnenbank <nieklinnenbank@gmail.com>,
	Greg Kurz <groug@kaod.org>,
	Laurent Vivier <laurent@vivier.eu>,
	Qiuhao Li <Qiuhao.Li@outlook.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Xiaojuan Yang <yangxiaojuan@loongson.cn>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Alexander Bulekov <alxndr@bu.edu>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	qemu-block@nongnu.org,
	Yanan Wang <wangyanan55@huawei.com>,
	David Woodhouse <dwmw2@infradead.org>,
	qemu-s390x@nongnu.org,
	Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
	Bandan Das <bsd@redhat.com>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Tyrone Ting <kfting@nuvoton.com>,
	Kevin Wolf <kwolf@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	Beniamino Galvani <b.galvani@gmail.com>,
	Paul Durrant <paul@xen.org>,
	Bin Meng <bin.meng@windriver.com>,
	Sunil Muthuswamy <sunilmut@microsoft.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Peter Xu <peterx@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Bernhard Beschow <shentey@gmail.com>,
	Amarjargal Gundjalam <amarjargal16@gmail.com>,
	Bin Meng <bmeng@tinylab.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>
Subject: [PATCH v2 31/32] contrib/gitdm: add more individual contributors
Date: Wed, 15 Mar 2023 17:43:30 +0000
Message-Id: <20230315174331.2959-32-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315174331.2959-1-alex.bennee@linaro.org>
References: <20230315174331.2959-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: TCfY6cFo8reJ

I've only added the names explicitly acked.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Bernhard Beschow <shentey@gmail.com>
Cc: Amarjargal Gundjalam <amarjargal16@gmail.com>
Cc: Bin Meng <bmeng@tinylab.org>
Cc: Jason A. Donenfeld <Jason@zx2c4.com>
Cc: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
Acked-by: Bernhard Beschow <shentey@gmail.com>
Message-Id: <20230310180332.2274827-10-alex.bennee@linaro.org>
---
 contrib/gitdm/group-map-individuals | 1 +
 1 file changed, 1 insertion(+)

diff --git a/contrib/gitdm/group-map-individuals b/contrib/gitdm/group-map-individuals
index e2263a5ee3..3264c7383d 100644
--- a/contrib/gitdm/group-map-individuals
+++ b/contrib/gitdm/group-map-individuals
@@ -38,3 +38,4 @@ paul@nowt.org
 git@xen0n.name
 simon@simonsafar.com
 research_trasio@irq.a4lg.com
+shentey@gmail.com
-- 
2.39.2
