Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp4045989wrx;
        Mon, 25 Mar 2019 09:20:24 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwmaH+QxfaBRWDaeNIvPxzE3IHoSq+nt2LFRRZPBtLbNeicuMj0fMerhtEbqkuJSJzySJ+M
X-Received: by 2002:a81:3d07:: with SMTP id k7mr21271204ywa.262.1553530824562;
        Mon, 25 Mar 2019 09:20:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553530824; cv=none;
        d=google.com; s=arc-20160816;
        b=N8fGGV4WNsULTIHCYxcPnhunmpRxnAjXbpazbrV6UvvYba16r9/s0HndAVnA8vTqaP
         PL+5dVpq5DzFh7obKSTjHMVBi5tipuUPGTd5sXZpNiPukSSJxPZ6la3un+I/nWzTWb67
         kt6odj9WcdiDslAUEvnc5+dsNgpmyYAEyD2ZMJSD+nRso02KURUGllwajY1/JybRlGLL
         rtII/0jtfHL46mkiCQ0RLzwtMjoJz4ayBAZUPZFfIQgUtM3LHsxjmn8AI1D3gPtKj9As
         k3x9ZIhec+Y1Hj3M05c9HjaEdPnU/9VNitBPok3htNBV5/ikbRssYUrCYIZre+/X4gOI
         bMCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=KIIzbmkWIPZqBxh1nsntKRwdBZyMC2qGIkCM6dqLnXw=;
        b=SaR3nE7hCmNcGxetWuw+rOkN5fy1zux5fo3YyDVA6QDsQNdm65g1QKTOVBKxbUrzqv
         BgtJ8brnBTr+QL7Pr6SPgIoZxEIREQJKYh5ujo2/6Zjt23ws0h4ZFahgoV8GwIx3LpBz
         LuZqQCUKeIjNwcuxxu6zfBgkVgUkeeFOnv0cw6a9XnpN40pYAlnjaUC1PiWGQZnf28Lt
         TswORJaRBCPz1O0cqVRMSu5V//aRKsxSco7WYcliLXFmyWP9p4E1Yjj4n450NT3bwxPR
         dKBYxNLfidtGRcAy1gZVeRfJU8zRSOK4vjDbORB/+rBD4DYJydb3+KMSsXlwYUHVakKv
         Ro6w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 206si9102601ybz.55.2019.03.25.09.20.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 25 Mar 2019 09:20:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:44997 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h8SKl-0007fH-So
	for alex.bennee@linaro.org; Mon, 25 Mar 2019 12:20:23 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36529)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1h8SGU-0003aF-Tt
	for qemu-arm@nongnu.org; Mon, 25 Mar 2019 12:16:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1h8S2Q-0005xn-6g
	for qemu-arm@nongnu.org; Mon, 25 Mar 2019 12:01:30 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47266)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <stefanha@redhat.com>)
	id 1h8S2P-0005x0-DD; Mon, 25 Mar 2019 12:01:25 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1C7D481DF6;
	Mon, 25 Mar 2019 16:01:24 +0000 (UTC)
Received: from localhost (ovpn-116-57.ams2.redhat.com [10.36.116.57])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 827FF17144;
	Mon, 25 Mar 2019 16:01:02 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 25 Mar 2019 15:58:57 +0000
Message-Id: <20190325155857.10661-8-stefanha@redhat.com>
In-Reply-To: <20190325155857.10661-1-stefanha@redhat.com>
References: <20190325155857.10661-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Mon, 25 Mar 2019 16:01:24 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PULL 7/7] trace-events: Fix attribution of trace points
 to source
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
	kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Michael Roth <mdroth@linux.vnet.ibm.com>,
	Gerd Hoffmann <kraxel@redhat.com>, Eric Blake <eblake@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org, qemu-block@nongnu.org,
	Juan Quintela <quintela@redhat.com>,
	Aleksandar Rikalo <arikalo@wavecomp.com>, Helge Deller <deller@gmx.de>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Eduardo Habkost <ehabkost@redhat.com>, Riku Voipio <riku.voipio@iki.fi>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Yuval Shaia <yuval.shaia@oracle.com>, Greg Kurz <groug@kaod.org>,
	Alex Williamson <alex.williamson@redhat.com>,
	Paul Durrant <paul.durrant@citrix.com>,
	Stefan Hajnoczi <stefanha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
	John Snow <jsnow@redhat.com>, Richard Henderson <rth@twiddle.net>,
	Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Cornelia Huck <cohuck@redhat.com>, qemu-s390x@nongnu.org,
	Max Reitz <mreitz@redhat.com>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pmFHpsfe27p6

From: Markus Armbruster <armbru@redhat.com>

Some trace points are attributed to the wrong source file.  Happens
when we neglect to update trace-events for code motion, or add events
in the wrong place, or misspell the file name.

Clean up with help of cleanup-trace-events.pl.  Same funnies as in the
previous commit, of course.  Manually shorten its change to
linux-user/trace-events to */signal.c.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-id: 20190314180929.27722-6-armbru@redhat.com
Message-Id: <20190314180929.27722-6-armbru@redhat.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 authz/trace-events       |  2 +-
 hw/9pfs/trace-events     |  2 +-
 hw/arm/trace-events      |  4 ++--
 hw/block/trace-events    |  3 ++-
 hw/char/trace-events     |  2 +-
 hw/display/trace-events  |  3 ++-
 hw/ide/trace-events      |  6 ++++--
 hw/input/trace-events    |  2 +-
 hw/misc/trace-events     |  8 +++++---
 hw/net/trace-events      |  8 ++++----
 hw/ppc/trace-events      |  6 +++++-
 hw/timer/trace-events    |  4 ++--
 hw/vfio/trace-events     |  2 +-
 hw/watchdog/trace-events |  2 +-
 linux-user/trace-events  |  1 +
 migration/trace-events   | 44 ++++++++++++++++++++++++----------------
 trace-events             | 11 ++++++++++
 ui/trace-events          |  5 +++++
 util/trace-events        |  6 +++---
 19 files changed, 78 insertions(+), 43 deletions(-)

diff --git a/authz/trace-events b/authz/trace-events
index 5cb577061c..e62ebb36b7 100644
--- a/authz/trace-events
+++ b/authz/trace-events
@@ -14,5 +14,5 @@ qauthz_list_default_policy(void *authz, const char *ide=
ntity, int policy) "AuthZ
 qauthz_list_file_load(void *authz, const char *filename) "AuthZ file %p =
load filename=3D%s"
 qauthz_list_file_refresh(void *authz, const char *filename, int success)=
 "AuthZ file %p load filename=3D%s success=3D%d"
=20
-# pam.c
+# pamacct.c
 qauthz_pam_check(void *authz, const char *identity, const char *service)=
 "AuthZ PAM %p identity=3D%s service=3D%s"
diff --git a/hw/9pfs/trace-events b/hw/9pfs/trace-events
index 0c14bda178..c0a0a4ab5d 100644
--- a/hw/9pfs/trace-events
+++ b/hw/9pfs/trace-events
@@ -1,6 +1,6 @@
 # See docs/devel/tracing.txt for syntax documentation.
=20
-# virtio-9p.c
+# 9p.c
 v9fs_rcancel(uint16_t tag, uint8_t id) "tag %d id %d"
 v9fs_rerror(uint16_t tag, uint8_t id, int err) "tag %d id %d err %d"
 v9fs_version(uint16_t tag, uint8_t id, int32_t msize, char* version) "ta=
g %d id %d msize %d version %s"
diff --git a/hw/arm/trace-events b/hw/arm/trace-events
index 441d12df5e..0acedcedc6 100644
--- a/hw/arm/trace-events
+++ b/hw/arm/trace-events
@@ -10,8 +10,6 @@ smmu_ptw_invalid_pte(int stage, int level, uint64_t bas=
eaddr, uint64_t pteaddr,
 smmu_ptw_page_pte(int stage, int level,  uint64_t iova, uint64_t baseadd=
r, uint64_t pteaddr, uint64_t pte, uint64_t address) "stage=3D%d level=3D=
%d iova=3D0x%"PRIx64" base@=3D0x%"PRIx64" pte@=3D0x%"PRIx64" pte=3D0x%"PR=
Ix64" page address =3D 0x%"PRIx64
 smmu_ptw_block_pte(int stage, int level, uint64_t baseaddr, uint64_t pte=
addr, uint64_t pte, uint64_t iova, uint64_t gpa, int bsize_mb) "stage=3D%=
d level=3D%d base@=3D0x%"PRIx64" pte@=3D0x%"PRIx64" pte=3D0x%"PRIx64" iov=
a=3D0x%"PRIx64" block address =3D 0x%"PRIx64" block size =3D %d MiB"
 smmu_get_pte(uint64_t baseaddr, int index, uint64_t pteaddr, uint64_t pt=
e) "baseaddr=3D0x%"PRIx64" index=3D0x%x, pteaddr=3D0x%"PRIx64", pte=3D0x%=
"PRIx64
-smmu_iotlb_cache_hit(uint16_t asid, uint64_t addr, uint32_t hit, uint32_=
t miss, uint32_t p) "IOTLB cache HIT asid=3D%d addr=3D0x%"PRIx64" hit=3D%=
d miss=3D%d hit rate=3D%d"
-smmu_iotlb_cache_miss(uint16_t asid, uint64_t addr, uint32_t hit, uint32=
_t miss, uint32_t p) "IOTLB cache MISS asid=3D%d addr=3D0x%"PRIx64" hit=3D=
%d miss=3D%d hit rate=3D%d"
 smmu_iotlb_inv_all(void) "IOTLB invalidate all"
 smmu_iotlb_inv_asid(uint16_t asid) "IOTLB invalidate asid=3D%d"
 smmu_iotlb_inv_iova(uint16_t asid, uint64_t addr) "IOTLB invalidate asid=
=3D%d addr=3D0x%"PRIx64
@@ -48,6 +46,8 @@ smmuv3_cmdq_tlbi_nh_va(int vmid, int asid, uint64_t add=
r, bool leaf) "vmid =3D%d a
 smmuv3_cmdq_tlbi_nh_vaa(int vmid, uint64_t addr) "vmid =3D%d addr=3D0x%"=
PRIx64
 smmuv3_cmdq_tlbi_nh(void) ""
 smmuv3_cmdq_tlbi_nh_asid(uint16_t asid) "asid=3D%d"
+smmu_iotlb_cache_hit(uint16_t asid, uint64_t addr, uint32_t hit, uint32_=
t miss, uint32_t p) "IOTLB cache HIT asid=3D%d addr=3D0x%"PRIx64" hit=3D%=
d miss=3D%d hit rate=3D%d"
+smmu_iotlb_cache_miss(uint16_t asid, uint64_t addr, uint32_t hit, uint32=
_t miss, uint32_t p) "IOTLB cache MISS asid=3D%d addr=3D0x%"PRIx64" hit=3D=
%d miss=3D%d hit rate=3D%d"
 smmuv3_config_cache_inv(uint32_t sid) "Config cache INV for sid %d"
 smmuv3_notify_flag_add(const char *iommu) "ADD SMMUNotifier node for iom=
mu mr=3D%s"
 smmuv3_notify_flag_del(const char *iommu) "DEL SMMUNotifier node for iom=
mu mr=3D%s"
diff --git a/hw/block/trace-events b/hw/block/trace-events
index 780416c13f..b92039a573 100644
--- a/hw/block/trace-events
+++ b/hw/block/trace-events
@@ -4,7 +4,8 @@
 fdc_ioport_read(uint8_t reg, uint8_t value) "read reg 0x%02x val 0x%02x"
 fdc_ioport_write(uint8_t reg, uint8_t value) "write reg 0x%02x val 0x%02=
x"
=20
-# pflash_cfi0?.c
+# pflash_cfi02.c
+# pflash_cfi01.c
 pflash_reset(void) "reset"
 pflash_read(uint64_t offset, uint8_t cmd, int width, uint8_t wcycle) "of=
fset:0x%04"PRIx64" cmd:0x%02x width:%d wcycle:%u"
 pflash_write(uint64_t offset, uint32_t value, int width, uint8_t wcycle)=
 "offset:0x%04"PRIx64" value:0x%03x width:%d wcycle:%u"
diff --git a/hw/char/trace-events b/hw/char/trace-events
index 3cbb55896b..2ce7f2f998 100644
--- a/hw/char/trace-events
+++ b/hw/char/trace-events
@@ -65,7 +65,7 @@ pl011_can_receive(uint32_t lcr, int read_count, int r) =
"LCR 0x%08x read_count %d
 pl011_put_fifo(uint32_t c, int read_count) "new char 0x%x read_count now=
 %d"
 pl011_put_fifo_full(void) "FIFO now full, RXFF set"
=20
-# cmsdk_apb_uart.c
+# cmsdk-apb-uart.c
 cmsdk_apb_uart_read(uint64_t offset, uint64_t data, unsigned size) "CMSD=
K APB UART read: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
 cmsdk_apb_uart_write(uint64_t offset, uint64_t data, unsigned size) "CMS=
DK APB UART write: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
 cmsdk_apb_uart_reset(void) "CMSDK APB UART: reset"
diff --git a/hw/display/trace-events b/hw/display/trace-events
index 212ceb0e85..ba7787b180 100644
--- a/hw/display/trace-events
+++ b/hw/display/trace-events
@@ -32,6 +32,7 @@ vmware_scratch_read(uint32_t index, uint32_t value) "in=
dex %d, value 0x%x"
 vmware_scratch_write(uint32_t index, uint32_t value) "index %d, value 0x=
%x"
 vmware_setmode(uint32_t w, uint32_t h, uint32_t bpp) "%dx%d @ %d bpp"
=20
+# virtio-gpu-3d.c
 # virtio-gpu.c
 virtio_gpu_features(bool virgl) "virgl %d"
 virtio_gpu_cmd_get_display_info(void) ""
@@ -138,6 +139,6 @@ sii9022_read_reg(uint8_t addr, uint8_t val) "addr 0x%=
02x, val 0x%02x"
 sii9022_write_reg(uint8_t addr, uint8_t val) "addr 0x%02x, val 0x%02x"
 sii9022_switch_mode(const char *mode) "mode: %s"
=20
-# ati*.c
+# ati.c
 ati_mm_read(unsigned int size, uint64_t addr, const char *name, uint64_t=
 val) "%u 0x%"PRIx64 " %s -> 0x%"PRIx64
 ati_mm_write(unsigned int size, uint64_t addr, const char *name, uint64_=
t val) "%u 0x%"PRIx64 " %s <- 0x%"PRIx64
diff --git a/hw/ide/trace-events b/hw/ide/trace-events
index ff757bf749..2e4162629f 100644
--- a/hw/ide/trace-events
+++ b/hw/ide/trace-events
@@ -114,9 +114,11 @@ ahci_dma_prepare_buf_fail(void *s, int port) "ahci(%=
p)[%d]: sglist population fa
 ahci_dma_rw_buf(void *s, int port, int l) "ahci(%p)[%d] len=3D0x%x"
 ahci_cmd_done(void *s, int port) "ahci(%p)[%d]: cmd done"
 ahci_reset(void *s) "ahci(%p): HBA reset"
-allwinner_ahci_mem_read(void *s, void *a, uint64_t addr, uint64_t val, u=
nsigned size) "ahci(%p): read a=3D%p addr=3D0x%"PRIx64" val=3D0x%"PRIx64"=
, size=3D%d"
-allwinner_ahci_mem_write(void *s, void *a, uint64_t addr, uint64_t val, =
unsigned size) "ahci(%p): write a=3D%p addr=3D0x%"PRIx64" val=3D0x%"PRIx6=
4", size=3D%d"
=20
 # Warning: Verbose
 handle_reg_h2d_fis_dump(void *s, int port, const char *fis) "ahci(%p)[%d=
]: %s"
 handle_cmd_fis_dump(void *s, int port, const char *fis) "ahci(%p)[%d]: %=
s"
+
+# ahci-allwinner.c
+allwinner_ahci_mem_read(void *s, void *a, uint64_t addr, uint64_t val, u=
nsigned size) "ahci(%p): read a=3D%p addr=3D0x%"PRIx64" val=3D0x%"PRIx64"=
, size=3D%d"
+allwinner_ahci_mem_write(void *s, void *a, uint64_t addr, uint64_t val, =
unsigned size) "ahci(%p): write a=3D%p addr=3D0x%"PRIx64" val=3D0x%"PRIx6=
4", size=3D%d"
diff --git a/hw/input/trace-events b/hw/input/trace-events
index 499e5a66e4..cf072fa2f8 100644
--- a/hw/input/trace-events
+++ b/hw/input/trace-events
@@ -51,5 +51,5 @@ hid_kbd_queue_empty(void) "queue empty"
 # tsc2005.c
 tsc2005_sense(const char *state) "touchscreen sense %s"
=20
-# virtio
+# virtio-input.c
 virtio_input_queue_full(void) "queue full"
diff --git a/hw/misc/trace-events b/hw/misc/trace-events
index 182c01703f..47e1bccf71 100644
--- a/hw/misc/trace-events
+++ b/hw/misc/trace-events
@@ -54,7 +54,7 @@ milkymist_pfpu_pulse_irq(void) "Pulse IRQ"
 # aspeed_scu.c
 aspeed_scu_write(uint64_t offset, unsigned size, uint32_t data) "To 0x%"=
 PRIx64 " of size %u: 0x%" PRIx32
=20
-# mps2_scc.c
+# mps2-scc.c
 mps2_scc_read(uint64_t offset, uint64_t data, unsigned size) "MPS2 SCC r=
ead: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
 mps2_scc_write(uint64_t offset, uint64_t data, unsigned size) "MPS2 SCC =
write: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
 mps2_scc_reset(void) "MPS2 SCC: reset"
@@ -62,7 +62,7 @@ mps2_scc_leds(char led7, char led6, char led5, char led=
4, char led3, char led2,
 mps2_scc_cfg_write(unsigned function, unsigned device, uint32_t value) "=
MPS2 SCC config write: function %d device %d data 0x%" PRIx32
 mps2_scc_cfg_read(unsigned function, unsigned device, uint32_t value) "M=
PS2 SCC config read: function %d device %d data 0x%" PRIx32
=20
-# mps2_fpgaio.c
+# mps2-fpgaio.c
 mps2_fpgaio_read(uint64_t offset, uint64_t data, unsigned size) "MPS2 FP=
GAIO read: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
 mps2_fpgaio_write(uint64_t offset, uint64_t data, unsigned size) "MPS2 F=
PGAIO write: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
 mps2_fpgaio_reset(void) "MPS2 FPGAIO: reset"
@@ -124,9 +124,11 @@ ccm_clock_freq(uint32_t clock, uint32_t freq) "(Cloc=
k =3D %d) =3D %d\n"
 ccm_read_reg(const char *reg_name, uint32_t value) "reg[%s] <=3D 0x%" PR=
Ix32 "\n"
 ccm_write_reg(const char *reg_name, uint32_t value) "reg[%s] =3D> 0x%" P=
RIx32 "\n"
=20
-# iotkit-sysctl.c
+# iotkit-sysinfo.c
 iotkit_sysinfo_read(uint64_t offset, uint64_t data, unsigned size) "IoTK=
it SysInfo read: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
 iotkit_sysinfo_write(uint64_t offset, uint64_t data, unsigned size) "IoT=
Kit SysInfo write: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
+
+# iotkit-sysctl.c
 iotkit_sysctl_read(uint64_t offset, uint64_t data, unsigned size) "IoTKi=
t SysCtl read: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
 iotkit_sysctl_write(uint64_t offset, uint64_t data, unsigned size) "IoTK=
it SysCtl write: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
 iotkit_sysctl_reset(void) "IoTKit SysCtl: reset"
diff --git a/hw/net/trace-events b/hw/net/trace-events
index a8f2658602..3cd9e122df 100644
--- a/hw/net/trace-events
+++ b/hw/net/trace-events
@@ -242,9 +242,11 @@ e1000e_irq_msix_pending_clearing(uint32_t cause, uin=
t32_t int_cfg, uint32_t vec)
 e1000e_wrn_msix_vec_wrong(uint32_t cause, uint32_t cfg) "Invalid configu=
ration for cause 0x%x: 0x%x"
 e1000e_wrn_msix_invalid(uint32_t cause, uint32_t cfg) "Invalid entry for=
 cause 0x%x: 0x%x"
=20
-e1000e_mac_set_permanent(uint8_t b0, uint8_t b1, uint8_t b2, uint8_t b3,=
 uint8_t b4, uint8_t b5) "Set permanent MAC: %02x:%02x:%02x:%02x:%02x:%02=
x"
 e1000e_mac_set_sw(uint8_t b0, uint8_t b1, uint8_t b2, uint8_t b3, uint8_=
t b4, uint8_t b5) "Set SW MAC: %02x:%02x:%02x:%02x:%02x:%02x"
=20
+e1000e_vm_state_running(void) "VM state is running"
+e1000e_vm_state_stopped(void) "VM state is stopped"
+
 # e1000e.c
 e1000e_cb_pci_realize(void) "E1000E PCI realize entry"
 e1000e_cb_pci_uninit(void) "E1000E PCI unit entry"
@@ -266,11 +268,9 @@ e1000e_msi_init_fail(int32_t res) "Failed to initial=
ize MSI, error %d"
 e1000e_msix_init_fail(int32_t res) "Failed to initialize MSI-X, error %d=
"
 e1000e_msix_use_vector_fail(uint32_t vec, int32_t res) "Failed to use MS=
I-X vector %d, error %d"
=20
+e1000e_mac_set_permanent(uint8_t b0, uint8_t b1, uint8_t b2, uint8_t b3,=
 uint8_t b4, uint8_t b5) "Set permanent MAC: %02x:%02x:%02x:%02x:%02x:%02=
x"
 e1000e_cfg_support_virtio(bool support) "Virtio header supported: %d"
=20
-e1000e_vm_state_running(void) "VM state is running"
-e1000e_vm_state_stopped(void) "VM state is stopped"
-
 # spapr_llan.c
 spapr_vlan_get_rx_bd_from_pool_found(int pool, int32_t count, uint32_t r=
x_bufs) "pool=3D%d count=3D%"PRId32" rxbufs=3D%"PRIu32
 spapr_vlan_get_rx_bd_from_page(int buf_ptr, uint64_t bd) "use_buf_ptr=3D=
%d bd=3D0x%016"PRIx64
diff --git a/hw/ppc/trace-events b/hw/ppc/trace-events
index 730387f024..f76448f532 100644
--- a/hw/ppc/trace-events
+++ b/hw/ppc/trace-events
@@ -12,6 +12,8 @@ spapr_pci_msi_retry(unsigned config_addr, unsigned req_=
num, unsigned max_irqs) "
 # spapr.c
 spapr_cas_failed(unsigned long n) "DT diff buffer is too small: %ld byte=
s"
 spapr_cas_continue(unsigned long n) "Copy changes to the guest: %ld byte=
s"
+
+# spapr_irq.c
 spapr_irq_free(int src, int irq, int num) "Source#%d, first irq %d, %d i=
rqs"
 spapr_irq_free_warn(int src, int irq) "Source#%d, irq %d is already free=
"
=20
@@ -36,6 +38,8 @@ spapr_iommu_xlate(uint64_t liobn, uint64_t ioba, uint64=
_t tce, unsigned perm, un
 spapr_iommu_new_table(uint64_t liobn, void *table, int fd) "liobn=3D0x%"=
PRIx64" table=3D%p fd=3D%d"
 spapr_iommu_pre_save(uint64_t liobn, uint32_t nb, uint64_t offs, uint32_=
t ps) "liobn=3D%"PRIx64" %"PRIx32" bus_offset=3D0x%"PRIx64" ps=3D%"PRIu32
 spapr_iommu_post_load(uint64_t liobn, uint32_t pre_nb, uint32_t post_nb,=
 uint64_t offs, uint32_t ps) "liobn=3D%"PRIx64" %"PRIx32" =3D> 0x%"PRIx32=
" bus_offset=3D0x%"PRIx64" ps=3D%"PRIu32
+
+# spapr_rtas_ddw.c
 spapr_iommu_ddw_query(uint64_t buid, uint32_t cfgaddr, unsigned wa, uint=
64_t win_size, uint32_t pgmask) "buid=3D0x%"PRIx64" addr=3D0x%"PRIx32", %=
u windows available, max window size=3D0x%"PRIx64", mask=3D0x%"PRIx32
 spapr_iommu_ddw_create(uint64_t buid, uint32_t cfgaddr, uint64_t pg_size=
, uint64_t req_size, uint64_t start, uint32_t liobn) "buid=3D0x%"PRIx64" =
addr=3D0x%"PRIx32", page size=3D0x%"PRIx64", requested=3D0x%"PRIx64", sta=
rt addr=3D0x%"PRIx64", liobn=3D0x%"PRIx32
 spapr_iommu_ddw_remove(uint32_t liobn) "liobn=3D0x%"PRIx32
@@ -61,7 +65,7 @@ spapr_drc_unrealize(uint32_t index) "drc: 0x%"PRIx32
 spapr_ovec_parse_vector(int vector, int byte, uint16_t vec_len, uint8_t =
entry) "read guest vector %2d, byte %3d / %3d: 0x%.2x"
 spapr_ovec_populate_dt(int byte, uint16_t vec_len, uint8_t entry) "encod=
ing guest vector byte %3d / %3d: 0x%.2x"
=20
-# spapr_rtas.c
+# spapr_drc.c
 spapr_rtas_get_sensor_state_not_supported(uint32_t index, uint32_t type)=
 "sensor index: 0x%"PRIx32", type: %"PRIu32
 spapr_rtas_get_sensor_state_invalid(uint32_t index) "sensor index: 0x%"P=
RIx32
 spapr_rtas_ibm_configure_connector_invalid(uint32_t index) "DRC index: 0=
x%"PRIx32
diff --git a/hw/timer/trace-events b/hw/timer/trace-events
index bdf8390514..dcaf3d6da6 100644
--- a/hw/timer/trace-events
+++ b/hw/timer/trace-events
@@ -56,12 +56,12 @@ systick_timer_tick(void) "systick reload"
 systick_read(uint64_t addr, uint32_t value, unsigned size) "systick read=
 addr 0x%" PRIx64 " data 0x%" PRIx32 " size %u"
 systick_write(uint64_t addr, uint32_t value, unsigned size) "systick wri=
te addr 0x%" PRIx64 " data 0x%" PRIx32 " size %u"
=20
-# cmsdk_apb_timer.c
+# cmsdk-apb-timer.c
 cmsdk_apb_timer_read(uint64_t offset, uint64_t data, unsigned size) "CMS=
DK APB timer read: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
 cmsdk_apb_timer_write(uint64_t offset, uint64_t data, unsigned size) "CM=
SDK APB timer write: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
 cmsdk_apb_timer_reset(void) "CMSDK APB timer: reset"
=20
-# cmsdk_apb_dualtimer.c
+# cmsdk-apb-dualtimer.c
 cmsdk_apb_dualtimer_read(uint64_t offset, uint64_t data, unsigned size) =
"CMSDK APB dualtimer read: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %=
u"
 cmsdk_apb_dualtimer_write(uint64_t offset, uint64_t data, unsigned size)=
 "CMSDK APB dualtimer write: offset 0x%" PRIx64 " data 0x%" PRIx64 " size=
 %u"
 cmsdk_apb_dualtimer_reset(void) "CMSDK APB dualtimer: reset"
diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
index 2df0e5b114..eb589930a5 100644
--- a/hw/vfio/trace-events
+++ b/hw/vfio/trace-events
@@ -91,6 +91,7 @@ vfio_region_write(const char *name, int index, uint64_t=
 addr, uint64_t data, uns
 vfio_region_read(char *name, int index, uint64_t addr, unsigned size, ui=
nt64_t data) " (%s:region%d+0x%"PRIx64", %d) =3D 0x%"PRIx64
 vfio_iommu_map_notify(const char *op, uint64_t iova_start, uint64_t iova=
_end) "iommu %s @ 0x%"PRIx64" - 0x%"PRIx64
 vfio_listener_region_add_skip(uint64_t start, uint64_t end) "SKIPPING re=
gion_add 0x%"PRIx64" - 0x%"PRIx64
+vfio_spapr_group_attach(int groupfd, int tablefd) "Attached groupfd %d t=
o liobn fd %d"
 vfio_listener_region_add_iommu(uint64_t start, uint64_t end) "region_add=
 [iommu] 0x%"PRIx64" - 0x%"PRIx64
 vfio_listener_region_add_ram(uint64_t iova_start, uint64_t iova_end, voi=
d *vaddr) "region_add [ram] 0x%"PRIx64" - 0x%"PRIx64" [%p]"
 vfio_listener_region_add_no_dma_map(const char *name, uint64_t iova, uin=
t64_t size, uint64_t page_size) "Region \"%s\" 0x%"PRIx64" size=3D0x%"PRI=
x64" is not aligned to 0x%"PRIx64" and cannot be mapped for DMA"
@@ -130,7 +131,6 @@ vfio_prereg_register(uint64_t va, uint64_t size, int =
ret) "va=3D0x%"PRIx64" size=3D0
 vfio_prereg_unregister(uint64_t va, uint64_t size, int ret) "va=3D0x%"PR=
Ix64" size=3D0x%"PRIx64" ret=3D%d"
 vfio_spapr_create_window(int ps, unsigned int levels, uint64_t ws, uint6=
4_t off) "pageshift=3D0x%x levels=3D%u winsize=3D0x%"PRIx64" offset=3D0x%=
"PRIx64
 vfio_spapr_remove_window(uint64_t off) "offset=3D0x%"PRIx64
-vfio_spapr_group_attach(int groupfd, int tablefd) "Attached groupfd %d t=
o liobn fd %d"
=20
 # display.c
 vfio_display_edid_available(void) ""
diff --git a/hw/watchdog/trace-events b/hw/watchdog/trace-events
index 444d578cf1..ab94d7df50 100644
--- a/hw/watchdog/trace-events
+++ b/hw/watchdog/trace-events
@@ -1,6 +1,6 @@
 # See docs/devel/tracing.txt for syntax documentation.
=20
-# cmsdk_apb_watchdog.c
+# cmsdk-apb-watchdog.c
 cmsdk_apb_watchdog_read(uint64_t offset, uint64_t data, unsigned size) "=
CMSDK APB watchdog read: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
 cmsdk_apb_watchdog_write(uint64_t offset, uint64_t data, unsigned size) =
"CMSDK APB watchdog write: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %=
u"
 cmsdk_apb_watchdog_reset(void) "CMSDK APB watchdog: reset"
diff --git a/linux-user/trace-events b/linux-user/trace-events
index 27da07359b..6df234bbb6 100644
--- a/linux-user/trace-events
+++ b/linux-user/trace-events
@@ -1,6 +1,7 @@
 # See docs/devel/tracing.txt for syntax documentation.
=20
 # signal.c
+# */signal.c
 user_setup_frame(void *env, uint64_t frame_addr) "env=3D%p frame_addr=3D=
0x%"PRIx64
 user_setup_rt_frame(void *env, uint64_t frame_addr) "env=3D%p frame_addr=
=3D0x%"PRIx64
 user_do_rt_sigreturn(void *env, uint64_t frame_addr) "env=3D%p frame_add=
r=3D0x%"PRIx64
diff --git a/migration/trace-events b/migration/trace-events
index 9727973b5c..5da4512030 100644
--- a/migration/trace-events
+++ b/migration/trace-events
@@ -46,12 +46,9 @@ savevm_state_iterate(void) ""
 savevm_state_cleanup(void) ""
 savevm_state_complete_precopy(void) ""
 vmstate_save(const char *idstr, const char *vmsd_name) "%s, %s"
-vmstate_save_state_pre_save_res(const char *name, int res) "%s/%d"
-vmstate_save_state_loop(const char *name, const char *field, int n_elems=
) "%s/%s[%d]"
-vmstate_save_state_top(const char *idstr) "%s"
-vmstate_subsection_save_loop(const char *name, const char *sub) "%s/%s"
-vmstate_subsection_save_top(const char *idstr) "%s"
 vmstate_load(const char *idstr, const char *vmsd_name) "%s, %s"
+postcopy_pause_incoming(void) ""
+postcopy_pause_incoming_continued(void) ""
=20
 # vmstate.c
 vmstate_load_field_error(const char *field, int ret) "field \"%s\" load =
failed, ret =3D %d"
@@ -62,6 +59,13 @@ vmstate_n_elems(const char *name, int n_elems) "%s: %d=
"
 vmstate_subsection_load(const char *parent) "%s"
 vmstate_subsection_load_bad(const char *parent,  const char *sub, const =
char *sub2) "%s: %s/%s"
 vmstate_subsection_load_good(const char *parent) "%s"
+vmstate_save_state_pre_save_res(const char *name, int res) "%s/%d"
+vmstate_save_state_loop(const char *name, const char *field, int n_elems=
) "%s/%s[%d]"
+vmstate_save_state_top(const char *idstr) "%s"
+vmstate_subsection_save_loop(const char *name, const char *sub) "%s/%s"
+vmstate_subsection_save_top(const char *idstr) "%s"
+
+# vmstate-types.c
 get_qtailq(const char *name, int version_id) "%s v%d"
 get_qtailq_end(const char *name, const char *reason, int val) "%s %s/%d"
 put_qtailq(const char *name, int version_id) "%s v%d"
@@ -103,6 +107,10 @@ ram_dirty_bitmap_sync_complete(void) ""
 ram_state_resume_prepare(uint64_t v) "%" PRId64
 colo_flush_ram_cache_begin(uint64_t dirty_pages) "dirty_pages %" PRIu64
 colo_flush_ram_cache_end(void) ""
+save_xbzrle_page_skipping(void) ""
+save_xbzrle_page_overflow(void) ""
+ram_save_iterate_big_wait(uint64_t milliconds, int iterations) "big wait=
: %" PRIu64 " milliseconds, %d iterations"
+ram_load_complete(int ret, uint64_t seq_iter) "exit_code %d seq iteratio=
n %" PRIu64
=20
 # migration.c
 await_return_path_close_on_source_close(void) ""
@@ -130,11 +138,7 @@ open_return_path_on_source_continue(void) ""
 postcopy_start(void) ""
 postcopy_pause_return_path(void) ""
 postcopy_pause_return_path_continued(void) ""
-postcopy_pause_fault_thread(void) ""
-postcopy_pause_fault_thread_continued(void) ""
 postcopy_pause_continued(void) ""
-postcopy_pause_incoming(void) ""
-postcopy_pause_incoming_continued(void) ""
 postcopy_start_set_run(void) ""
 source_return_path_thread_bad_end(void) ""
 source_return_path_thread_end(void) ""
@@ -143,17 +147,19 @@ source_return_path_thread_loop_top(void) ""
 source_return_path_thread_pong(uint32_t val) "0x%x"
 source_return_path_thread_shut(uint32_t val) "0x%x"
 source_return_path_thread_resume_ack(uint32_t v) "%"PRIu32
-migrate_global_state_post_load(const char *state) "loaded state: %s"
-migrate_global_state_pre_save(const char *state) "saved state: %s"
 migration_thread_low_pending(uint64_t pending) "%" PRIu64
-migrate_state_too_big(void) ""
 migrate_transferred(uint64_t tranferred, uint64_t time_spent, uint64_t b=
andwidth, uint64_t size) "transferred %" PRIu64 " time_spent %" PRIu64 " =
bandwidth %" PRIu64 " max_size %" PRId64
 process_incoming_migration_co_end(int ret, int ps) "ret=3D%d postcopy-st=
ate=3D%d"
 process_incoming_migration_co_postcopy_end_main(void) ""
+
+# channel.c
 migration_set_incoming_channel(void *ioc, const char *ioctype) "ioc=3D%p=
 ioctype=3D%s"
 migration_set_outgoing_channel(void *ioc, const char *ioctype, const cha=
r *hostname, void *err)  "ioc=3D%p ioctype=3D%s hostname=3D%s err=3D%p"
-mark_postcopy_blocktime_begin(uint64_t addr, void *dd, uint32_t time, in=
t cpu, int received) "addr: 0x%" PRIx64 ", dd: %p, time: %u, cpu: %d, alr=
eady_received: %d"
-mark_postcopy_blocktime_end(uint64_t addr, void *dd, uint32_t time, int =
affected_cpu) "addr: 0x%" PRIx64 ", dd: %p, time: %u, affected_cpu: %d"
+
+# global_state.c
+migrate_state_too_big(void) ""
+migrate_global_state_post_load(const char *state) "loaded state: %s"
+migrate_global_state_pre_save(const char *state) "saved state: %s"
=20
 # rdma.c
 qemu_rdma_accept_incoming_migration(void) ""
@@ -226,6 +232,10 @@ postcopy_nhp_range(const char *ramblock, void *host_=
addr, size_t offset, size_t
 postcopy_place_page(void *host_addr) "host=3D%p"
 postcopy_place_page_zero(void *host_addr) "host=3D%p"
 postcopy_ram_enable_notify(void) ""
+mark_postcopy_blocktime_begin(uint64_t addr, void *dd, uint32_t time, in=
t cpu, int received) "addr: 0x%" PRIx64 ", dd: %p, time: %u, cpu: %d, alr=
eady_received: %d"
+mark_postcopy_blocktime_end(uint64_t addr, void *dd, uint32_t time, int =
affected_cpu) "addr: 0x%" PRIx64 ", dd: %p, time: %u, affected_cpu: %d"
+postcopy_pause_fault_thread(void) ""
+postcopy_pause_fault_thread_continued(void) ""
 postcopy_ram_fault_thread_entry(void) ""
 postcopy_ram_fault_thread_exit(void) ""
 postcopy_ram_fault_thread_fds_core(int baseufd, int quitfd) "ufd: %d qui=
tfd: %d"
@@ -241,10 +251,6 @@ postcopy_request_shared_page(const char *sharer, con=
st char *rb, uint64_t rb_off
 postcopy_request_shared_page_present(const char *sharer, const char *rb,=
 uint64_t rb_offset) "%s already %s offset 0x%"PRIx64
 postcopy_wake_shared(uint64_t client_addr, const char *rb) "at 0x%"PRIx6=
4" in %s"
=20
-save_xbzrle_page_skipping(void) ""
-save_xbzrle_page_overflow(void) ""
-ram_save_iterate_big_wait(uint64_t milliconds, int iterations) "big wait=
: %" PRIu64 " milliseconds, %d iterations"
-ram_load_complete(int ret, uint64_t seq_iter) "exit_code %d seq iteratio=
n %" PRIu64
 get_mem_fault_cpu_index(int cpu, uint32_t pid) "cpu: %d, pid: %u"
=20
 # exec.c
@@ -272,6 +278,8 @@ migration_tls_incoming_handshake_complete(void) ""
 colo_vm_state_change(const char *old, const char *new) "Change '%s' =3D>=
 '%s'"
 colo_send_message(const char *msg) "Send '%s' message"
 colo_receive_message(const char *msg) "Receive '%s' message"
+
+# colo-failover.c
 colo_failover_set_state(const char *new_state) "new state %s"
=20
 # block-dirty-bitmap.c
diff --git a/trace-events b/trace-events
index b48f417225..844ee58dd9 100644
--- a/trace-events
+++ b/trace-events
@@ -123,24 +123,32 @@ qmp_job_dismiss(void *job) "job %p"
=20
 ## vCPU
=20
+# trace/control-target.c
+
 # Hot-plug a new virtual (guest) CPU
 #
 # Mode: user, softmmu
 # Targets: all
 vcpu guest_cpu_enter(void)
=20
+# trace/control.c
+
 # Hot-unplug a virtual (guest) CPU
 #
 # Mode: user, softmmu
 # Targets: all
 vcpu guest_cpu_exit(void)
=20
+# qom/cpu.c
+
 # Reset the state of a virtual (guest) CPU
 #
 # Mode: user, softmmu
 # Targets: all
 vcpu guest_cpu_reset(void)
=20
+# tcg/tcg-op.c
+
 # @vaddr: Access' virtual address.
 # @info : Access' information (see below).
 #
@@ -161,6 +169,9 @@ vcpu guest_cpu_reset(void)
 # Targets: TCG(all)
 vcpu tcg guest_mem_before(TCGv vaddr, uint8_t info) "info=3D%d", "vaddr=3D=
0x%016"PRIx64" info=3D%d"
=20
+# linux-user/syscall.c
+# bsd-user/syscall.c
+
 # @num: System call number.
 # @arg*: System call argument value.
 #
diff --git a/ui/trace-events b/ui/trace-events
index e414bee75a..63de72a798 100644
--- a/ui/trace-events
+++ b/ui/trace-events
@@ -18,6 +18,8 @@ displaychangelistener_unregister(void *dcl, const char =
*name) "%p [ %s ]"
 ppm_save(const char *filename, void *display_surface) "%s surface=3D%p"
=20
 # gtk.c
+# gtk-gl-area.c
+# gtk-egl.c
 gd_switch(const char *tab, int width, int height) "tab=3D%s, width=3D%d,=
 height=3D%d"
 gd_update(const char *tab, int x, int y, int w, int h) "tab=3D%s, x=3D%d=
, y=3D%d, w=3D%d, h=3D%d"
 gd_key_event(const char *tab, int gdk_keycode, int qkeycode, const char =
*action) "tab=3D%s, translated GDK keycode %d to QKeyCode %d (%s)"
@@ -25,6 +27,9 @@ gd_grab(const char *tab, const char *device, const char=
 *reason) "tab=3D%s, dev=3D%s
 gd_ungrab(const char *tab, const char *device) "tab=3D%s, dev=3D%s"
 gd_keymap_windowing(const char *name) "backend=3D%s"
=20
+# vnc-auth-sasl.c
+# vnc-ws.c
+# vnc-auth-vencrypt.c
 # vnc.c
 vnc_key_guest_leds(bool caps, bool num, bool scroll) "caps %d, num %d, s=
croll %d"
 vnc_key_map_init(const char *layout) "%s"
diff --git a/util/trace-events b/util/trace-events
index ddd7300743..56c27287be 100644
--- a/util/trace-events
+++ b/util/trace-events
@@ -21,7 +21,7 @@ buffer_move_empty(const char *buf, size_t len, const ch=
ar *from) "%s: %zd bytes
 buffer_move(const char *buf, size_t len, const char *from) "%s: %zd byte=
s from %s"
 buffer_free(const char *buf, size_t len) "%s: capacity %zd"
=20
-# filemonitor.c
+# filemonitor-inotify.c
 qemu_file_monitor_add_watch(void *mon, const char *dirpath, const char *=
filename, void *cb, void *opaque, int id) "File monitor %p add watch dir=3D=
'%s' file=3D'%s' cb=3D%p opaque=3D%p id=3D%u"
 qemu_file_monitor_remove_watch(void *mon, const char *dirpath, int id) "=
File monitor %p remove watch dir=3D'%s' id=3D%u"
 qemu_file_monitor_new(void *mon, int fd) "File monitor %p created fd=3D%=
d"
@@ -42,8 +42,8 @@ qemu_co_mutex_lock_return(void *mutex, void *self) "mut=
ex %p self %p"
 qemu_co_mutex_unlock_entry(void *mutex, void *self) "mutex %p self %p"
 qemu_co_mutex_unlock_return(void *mutex, void *self) "mutex %p self %p"
=20
-# oslib-posix.c
 # oslib-win32.c
+# oslib-posix.c
 qemu_memalign(size_t alignment, size_t size, void *ptr) "alignment %zu s=
ize %zu ptr %p"
 qemu_anon_ram_alloc(size_t size, void *ptr) "size %zu ptr %p"
 qemu_vfree(void *ptr) "ptr %p"
@@ -64,7 +64,7 @@ lockcnt_futex_wait(const void *lockcnt, int val) "lockc=
nt %p waiting on %d"
 lockcnt_futex_wait_resume(const void *lockcnt, int new) "lockcnt %p afte=
r wait: %d"
 lockcnt_futex_wake(const void *lockcnt) "lockcnt %p waking up one waiter=
"
=20
-# qemu-thread.c
+# qemu-thread-common.h
 qemu_mutex_lock(void *mutex, const char *file, const int line) "waiting =
on mutex %p (%s:%d)"
 qemu_mutex_locked(void *mutex, const char *file, const int line) "taken =
mutex %p (%s:%d)"
 qemu_mutex_unlock(void *mutex, const char *file, const int line) "releas=
ed mutex %p (%s:%d)"
--=20
2.20.1

