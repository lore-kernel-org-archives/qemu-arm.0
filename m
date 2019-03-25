Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp4047265wrx;
        Mon, 25 Mar 2019 09:21:39 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxJph8yADA3Kww1feoaCOVKodSGfV1xb5hPekoC3MW1aDwdcAVWkzvNAxs7NlvSdIM/kW9Z
X-Received: by 2002:a81:a64d:: with SMTP id d74mr21633780ywh.196.1553530899610;
        Mon, 25 Mar 2019 09:21:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553530899; cv=none;
        d=google.com; s=arc-20160816;
        b=b4MwrdLsKQMt1xQXwa2yb3CdzG63pc33O2gvD6irwO7j399JXBfmd5+BrI27x6noD+
         mHthe1c2dAauMGBdClqUOiCD92aMxxWrQUcrbAo5E7VSoFdgRe338bcyr+6JC+nzX/Sz
         vECD2O++SRtBfD5d8rm+nbFJ97sqQGR5GCp07SUzNQNMw09IVZTI2CAHNHt06QlBEdgA
         p3d+YGAMCcjpA0Rr+YP28/cJYEB9zDvd0Tx0FVhvSWcL6XAQLZ7gGpS2Hrcslkfksvyj
         4B2+sWHm1IL0nuldeCsCmVliP9TklBGlIfLBaD9ph9XGmntp0LT+AoMTmmfXhj2cGtde
         /bZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=rsUyFknU8huP/Hwcp8fMQrK/NoGenjD+JH+D0beZiAY=;
        b=07GKtXwZ+gdr/t88Roi/mjIo99ZnTwQAZ9NzNZciUmiCZ3zqoxvTBdCH9UJLCxOwYa
         njbyv7dhLHxD38iilquiLC3wIjuaUJF5qZpFYo6Lb4az+R+XINwwt2vgb1dghRoC5zDs
         BFTXhV6lUYqmnK0Bo8xIz3FSXqdOFtJ0WMA4k62s/kceTqXB2XTsfWKbwFUAiv96bICG
         o0j+SbMB9TNr3OtyTN9akwzif7XUgawFIyAWIjV52dygsfvXDsTfc1LBAWZm1tql1/Ho
         XRaXyrIw9kyTqZDQ/c5h6CFIu66Rzd3V4OslGrQks5uvC1pcWuyS2bbuXJIeTVmhE/KO
         i/GA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t6si3561352ybg.186.2019.03.25.09.21.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 25 Mar 2019 09:21:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:45026 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h8SLy-00081l-UZ
	for alex.bennee@linaro.org; Mon, 25 Mar 2019 12:21:39 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36823)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1h8SGX-00046Q-Ax
	for qemu-devel@nongnu.org; Mon, 25 Mar 2019 12:16:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1h8S2F-0005pw-37
	for qemu-devel@nongnu.org; Mon, 25 Mar 2019 12:01:17 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47290)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <stefanha@redhat.com>)
	id 1h8S22-0005jY-MD; Mon, 25 Mar 2019 12:01:04 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5E4F033025A;
	Mon, 25 Mar 2019 16:01:01 +0000 (UTC)
Received: from localhost (ovpn-116-57.ams2.redhat.com [10.36.116.57])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DF36B8429D;
	Mon, 25 Mar 2019 16:00:44 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 25 Mar 2019 15:58:56 +0000
Message-Id: <20190325155857.10661-7-stefanha@redhat.com>
In-Reply-To: <20190325155857.10661-1-stefanha@redhat.com>
References: <20190325155857.10661-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Mon, 25 Mar 2019 16:01:01 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 6/7] trace-events: Delete unused trace points
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
	kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Michael Roth <mdroth@linux.vnet.ibm.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org, qemu-block@nongnu.org,
	Juan Quintela <quintela@redhat.com>,
	Aleksandar Rikalo <arikalo@wavecomp.com>, Helge Deller <deller@gmx.de>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
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
	Cornelia Huck <cohuck@redhat.com>, qemu-s390x@nongnu.org,
	Max Reitz <mreitz@redhat.com>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FqJAYZsNH6sz

From: Markus Armbruster <armbru@redhat.com>

Tracked down with cleanup-trace-events.pl.  Funnies requiring manual
post-processing:

* block.c and blockdev.c trace points are in block/trace-events.

* hw/block/nvme.c uses the preprocessor to hide its trace point use
  from cleanup-trace-events.pl.

* include/hw/xen/xen_common.h trace points are in hw/xen/trace-events.

* net/colo-compare and net/filter-rewriter.c use pseudo trace points
  colo_compare_udp_miscompare and colo_filter_rewriter_debug to guard
  debug code.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-id: 20190314180929.27722-5-armbru@redhat.com
Message-Id: <20190314180929.27722-5-armbru@redhat.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 block/trace-events         | 1 -
 hw/arm/trace-events        | 7 -------
 hw/block/trace-events      | 2 --
 hw/display/trace-events    | 1 -
 hw/i386/trace-events       | 2 --
 hw/ide/trace-events        | 1 -
 hw/intc/trace-events       | 1 -
 hw/misc/macio/trace-events | 1 -
 hw/misc/trace-events       | 2 --
 hw/ppc/trace-events        | 8 --------
 hw/sd/trace-events         | 1 -
 hw/vfio/trace-events       | 1 -
 nbd/trace-events           | 2 --
 util/trace-events          | 2 --
 14 files changed, 32 deletions(-)

diff --git a/block/trace-events b/block/trace-events
index 28b6364f28..e6bb5a8f05 100644
--- a/block/trace-events
+++ b/block/trace-events
@@ -57,7 +57,6 @@ qmp_block_stream(void *bs, void *job) "bs %p job %p"
=20
 # file-posix.c
 # file-win32.c
-file_paio_submit_co(int64_t offset, int count, int type) "offset %"PRId6=
4" count %d type %d"
 file_paio_submit(void *acb, void *opaque, int64_t offset, int count, int=
 type) "acb %p opaque %p offset %"PRId64" count %d type %d"
 file_copy_file_range(void *bs, int src, int64_t src_off, int dst, int64_=
t dst_off, int64_t bytes, int flags, int64_t ret) "bs %p src_fd %d offset=
 %"PRIu64" dst_fd %d offset %"PRIu64" bytes %"PRIu64" flags %d ret %"PRId=
64
=20
diff --git a/hw/arm/trace-events b/hw/arm/trace-events
index 3e91ca37a9..441d12df5e 100644
--- a/hw/arm/trace-events
+++ b/hw/arm/trace-events
@@ -5,8 +5,6 @@ virt_acpi_setup(void) "No fw cfg or ACPI disabled. Bailin=
g out."
=20
 # smmu-common.c
 smmu_add_mr(const char *name) "%s"
-smmu_page_walk(int stage, uint64_t baseaddr, int first_level, uint64_t s=
tart, uint64_t end) "stage=3D%d, baseaddr=3D0x%"PRIx64", first level=3D%d=
, start=3D0x%"PRIx64", end=3D0x%"PRIx64
-smmu_lookup_table(int level, uint64_t baseaddr, int granule_sz, uint64_t=
 start, uint64_t end, int flags, uint64_t subpage_size) "level=3D%d basea=
ddr=3D0x%"PRIx64" granule=3D%d, start=3D0x%"PRIx64" end=3D0x%"PRIx64" fla=
gs=3D%d subpage_size=3D0x%"PRIx64
 smmu_ptw_level(int level, uint64_t iova, size_t subpage_size, uint64_t b=
aseaddr, uint32_t offset, uint64_t pte) "level=3D%d iova=3D0x%"PRIx64" su=
bpage_sz=3D0x%zx baseaddr=3D0x%"PRIx64" offset=3D%d =3D> pte=3D0x%"PRIx64
 smmu_ptw_invalid_pte(int stage, int level, uint64_t baseaddr, uint64_t p=
teaddr, uint32_t offset, uint64_t pte) "stage=3D%d level=3D%d base@=3D0x%=
"PRIx64" pte@=3D0x%"PRIx64" offset=3D%d pte=3D0x%"PRIx64
 smmu_ptw_page_pte(int stage, int level,  uint64_t iova, uint64_t baseadd=
r, uint64_t pteaddr, uint64_t pte, uint64_t address) "stage=3D%d level=3D=
%d iova=3D0x%"PRIx64" base@=3D0x%"PRIx64" pte@=3D0x%"PRIx64" pte=3D0x%"PR=
Ix64" page address =3D 0x%"PRIx64
@@ -29,12 +27,7 @@ smmuv3_cmdq_consume(uint32_t prod, uint32_t cons, uint=
8_t prod_wrap, uint8_t con
 smmuv3_cmdq_opcode(const char *opcode) "<--- %s"
 smmuv3_cmdq_consume_out(uint32_t prod, uint32_t cons, uint8_t prod_wrap,=
 uint8_t cons_wrap) "prod:%d, cons:%d, prod_wrap:%d, cons_wrap:%d "
 smmuv3_cmdq_consume_error(const char *cmd_name, uint8_t cmd_error) "Erro=
r on %s command execution: %d"
-smmuv3_update(bool is_empty, uint32_t prod, uint32_t cons, uint8_t prod_=
wrap, uint8_t cons_wrap) "q empty:%d prod:%d cons:%d p.wrap:%d p.cons:%d"
-smmuv3_update_check_cmd(int error) "cmdq not enabled or error :0x%x"
 smmuv3_write_mmio(uint64_t addr, uint64_t val, unsigned size, uint32_t r=
) "addr: 0x%"PRIx64" val:0x%"PRIx64" size: 0x%x(%d)"
-smmuv3_write_mmio_idr(uint64_t addr, uint64_t val) "write to RO/Unimpl r=
eg 0x%"PRIx64" val64:0x%"PRIx64
-smmuv3_write_mmio_evtq_cons_bef_clear(uint32_t prod, uint32_t cons, uint=
8_t prod_wrap, uint8_t cons_wrap) "Before clearing interrupt prod:0x%x co=
ns:0x%x prod.w:%d cons.w:%d"
-smmuv3_write_mmio_evtq_cons_after_clear(uint32_t prod, uint32_t cons, ui=
nt8_t prod_wrap, uint8_t cons_wrap) "after clearing interrupt prod:0x%x c=
ons:0x%x prod.w:%d cons.w:%d"
 smmuv3_record_event(const char *type, uint32_t sid) "%s sid=3D%d"
 smmuv3_find_ste(uint16_t sid, uint32_t features, uint16_t sid_split) "SI=
D:0x%x features:0x%x, sid_split:0x%x"
 smmuv3_find_ste_2lvl(uint64_t strtab_base, uint64_t l1ptr, int l1_ste_of=
fset, uint64_t l2ptr, int l2_ste_offset, int max_l2_ste) "strtab_base:0x%=
"PRIx64" l1ptr:0x%"PRIx64" l1_off:0x%x, l2ptr:0x%"PRIx64" l2_off:0x%x max=
_l2_ste:%d"
diff --git a/hw/block/trace-events b/hw/block/trace-events
index 239753c92b..780416c13f 100644
--- a/hw/block/trace-events
+++ b/hw/block/trace-events
@@ -63,9 +63,7 @@ nvme_err_invalid_dma(void) "PRP/SGL is too small for tr=
ansfer size"
 nvme_err_invalid_prplist_ent(uint64_t prplist) "PRP list entry is null o=
r not page aligned: 0x%"PRIx64""
 nvme_err_invalid_prp2_align(uint64_t prp2) "PRP2 is not page aligned: 0x=
%"PRIx64""
 nvme_err_invalid_prp2_missing(void) "PRP2 is null and more data to be tr=
ansferred"
-nvme_err_invalid_field(void) "invalid field"
 nvme_err_invalid_prp(void) "invalid PRP"
-nvme_err_invalid_sgl(void) "invalid SGL"
 nvme_err_invalid_ns(uint32_t ns, uint32_t limit) "invalid namespace %u n=
ot within 1-%u"
 nvme_err_invalid_opc(uint8_t opc) "invalid opcode 0x%"PRIx8""
 nvme_err_invalid_admin_opc(uint8_t opc) "invalid admin opcode 0x%"PRIx8"=
"
diff --git a/hw/display/trace-events b/hw/display/trace-events
index 3a0662cdf1..212ceb0e85 100644
--- a/hw/display/trace-events
+++ b/hw/display/trace-events
@@ -131,7 +131,6 @@ vga_vbe_write(uint32_t index, uint32_t val) "index 0x=
%x, val 0x%x"
 # cirrus_vga.c
 vga_cirrus_read_io(uint32_t addr, uint32_t val) "addr 0x%x, val 0x%x"
 vga_cirrus_write_io(uint32_t addr, uint32_t val) "addr 0x%x, val 0x%x"
-vga_cirrus_read_blt(uint32_t offset, uint32_t val) "offset 0x%x, val 0x%=
x"
 vga_cirrus_write_blt(uint32_t offset, uint32_t val) "offset 0x%x, val 0x=
%x"
=20
 # sii9022.c
diff --git a/hw/i386/trace-events b/hw/i386/trace-events
index b7eb856a77..83f8369778 100644
--- a/hw/i386/trace-events
+++ b/hw/i386/trace-events
@@ -106,8 +106,6 @@ amdvi_ir_err(const char *str) "%s"
 amdvi_ir_intctl(uint8_t val) "int_ctl 0x%"PRIx8
 amdvi_ir_target_abort(const char *str) "%s"
 amdvi_ir_delivery_mode(const char *str) "%s"
-amdvi_ir_generate_msi_message(uint8_t vector, uint8_t delivery_mode, uin=
t8_t dest_mode, uint8_t dest, uint8_t rh) "vector %d delivery-mode %d des=
t-mode %d dest-id %d rh %d"
-amdvi_ir_irte_ga(uint64_t addr, uint64_t data) "addr 0x%"PRIx64" offset =
0x%"PRIx64
 amdvi_ir_irte_ga_val(uint64_t hi, uint64_t lo) "hi 0x%"PRIx64" lo 0x%"PR=
Ix64
=20
 # vmport.c
diff --git a/hw/ide/trace-events b/hw/ide/trace-events
index ac39561d88..ff757bf749 100644
--- a/hw/ide/trace-events
+++ b/hw/ide/trace-events
@@ -91,7 +91,6 @@ ahci_populate_sglist_short_map(void *s, int port) "ahci=
(%p)[%d]: mapped less tha
 ahci_populate_sglist_bad_offset(void *s, int port, int off_idx, int64_t =
off_pos) "ahci(%p)[%d]: Incorrect offset! off_idx: %d, off_pos: %"PRId64
 ncq_finish(void *s, int port, uint8_t tag) "ahci(%p)[%d][tag:%d]: NCQ tr=
ansfer finished"
 execute_ncq_command_read(void *s, int port, uint8_t tag, int count, int6=
4_t lba) "ahci(%p)[%d][tag:%d]: NCQ reading %d sectors from LBA %"PRId64
-execute_ncq_command_write(void *s, int port, uint8_t tag, int count, int=
64_t lba) "ahci(%p)[%d][tag:%d]: NCQ writing %d sectors to LBA %"PRId64
 execute_ncq_command_unsup(void *s, int port, uint8_t tag, uint8_t cmd) "=
ahci(%p)[%d][tag:%d]: error: unsupported NCQ command (0x%02x) received"
 process_ncq_command_mismatch(void *s, int port, uint8_t tag, uint8_t slo=
t) "ahci(%p)[%d][tag:%d]: Warning: NCQ slot (%d) did not match the given =
tag"
 process_ncq_command_aux(void *s, int port, uint8_t tag) "ahci(%p)[%d][ta=
g:%d]: Warn: Attempt to use NCQ auxiliary fields"
diff --git a/hw/intc/trace-events b/hw/intc/trace-events
index e9ee6554fe..a28bdce925 100644
--- a/hw/intc/trace-events
+++ b/hw/intc/trace-events
@@ -187,7 +187,6 @@ nvic_escalate_prio(int irq, int irqprio, int runprio)=
 "NVIC escalating irq %d to
 nvic_escalate_disabled(int irq) "NVIC escalating irq %d to HardFault: di=
sabled"
 nvic_set_pending(int irq, bool secure, bool targets_secure, bool derived=
, int en, int prio) "NVIC set pending irq %d secure-bank %d targets_secur=
e %d derived %d (enabled: %d priority %d)"
 nvic_clear_pending(int irq, bool secure, int en, int prio) "NVIC clear p=
ending irq %d secure-bank %d (enabled: %d priority %d)"
-nvic_set_pending_level(int irq) "NVIC set pending: irq %d higher prio th=
an vectpending: setting irq line to 1"
 nvic_acknowledge_irq(int irq, int prio) "NVIC acknowledge IRQ: %d now ac=
tive (prio %d)"
 nvic_get_pending_irq_info(int irq, bool secure) "NVIC next IRQ %d: targe=
ts_secure: %d"
 nvic_complete_irq(int irq, bool secure) "NVIC complete IRQ %d (secure %d=
)"
diff --git a/hw/misc/macio/trace-events b/hw/misc/macio/trace-events
index 369f3c0f89..e4a1cc0d24 100644
--- a/hw/misc/macio/trace-events
+++ b/hw/misc/macio/trace-events
@@ -19,7 +19,6 @@ macio_set_gpio(int gpio, bool state) "setting GPIO %d t=
o %d"
 macio_gpio_irq_assert(int gpio) "asserting GPIO %d"
 macio_gpio_irq_deassert(int gpio) "deasserting GPIO %d"
 macio_gpio_write(uint64_t addr, uint64_t val) "addr: 0x%"PRIx64" value: =
0x%"PRIx64
-macio_gpio_read(uint64_t addr, uint64_t val) "addr: 0x%"PRIx64" value: 0=
x%"PRIx64
=20
 # pmu.c
 pmu_adb_poll(int olen) "ADB autopoll, olen=3D%d"
diff --git a/hw/misc/trace-events b/hw/misc/trace-events
index 7095e48f97..182c01703f 100644
--- a/hw/misc/trace-events
+++ b/hw/misc/trace-events
@@ -96,7 +96,6 @@ tz_mpc_iommu_notify(uint64_t addr) "TZ MPC iommu: notif=
ying UNMAP/MAP for 0x%" P
 tz_msc_reset(void) "TZ MSC: reset"
 tz_msc_cfg_nonsec(int level) "TZ MSC: cfg_nonsec =3D %d"
 tz_msc_cfg_sec_resp(int level) "TZ MSC: cfg_sec_resp =3D %d"
-tz_msc_irq_enable(int level) "TZ MSC: int_enable =3D %d"
 tz_msc_irq_clear(int level) "TZ MSC: int_clear =3D %d"
 tz_msc_update_irq(int level) "TZ MSC: setting irq line to %d"
 tz_msc_access_blocked(uint64_t offset) "TZ MSC: offset 0x%" PRIx64 " acc=
ess blocked"
@@ -117,7 +116,6 @@ iotkit_secctl_s_read(uint32_t offset, uint64_t data, =
unsigned size) "IoTKit SecC
 iotkit_secctl_s_write(uint32_t offset, uint64_t data, unsigned size) "Io=
TKit SecCtl S regs write: offset 0x%x data 0x%" PRIx64 " size %u"
 iotkit_secctl_ns_read(uint32_t offset, uint64_t data, unsigned size) "Io=
TKit SecCtl NS regs read: offset 0x%x data 0x%" PRIx64 " size %u"
 iotkit_secctl_ns_write(uint32_t offset, uint64_t data, unsigned size) "I=
oTKit SecCtl NS regs write: offset 0x%x data 0x%" PRIx64 " size %u"
-iotkit_secctl_reset(void) "IoTKit SecCtl: reset"
=20
 # imx6ul_ccm.c
 ccm_entry(void) "\n"
diff --git a/hw/ppc/trace-events b/hw/ppc/trace-events
index d1d8b71bfa..730387f024 100644
--- a/hw/ppc/trace-events
+++ b/hw/ppc/trace-events
@@ -12,13 +12,10 @@ spapr_pci_msi_retry(unsigned config_addr, unsigned re=
q_num, unsigned max_irqs) "
 # spapr.c
 spapr_cas_failed(unsigned long n) "DT diff buffer is too small: %ld byte=
s"
 spapr_cas_continue(unsigned long n) "Copy changes to the guest: %ld byte=
s"
-spapr_irq_alloc(int irq) "irq %d"
-spapr_irq_alloc_block(int first, int num, bool lsi, int align) "first ir=
q %d, %d irqs, lsi=3D%d, alignnum %d"
 spapr_irq_free(int src, int irq, int num) "Source#%d, first irq %d, %d i=
rqs"
 spapr_irq_free_warn(int src, int irq) "Source#%d, irq %d is already free=
"
=20
 # spapr_hcall.c
-spapr_cas_pvr_try(uint32_t pvr) "0x%x"
 spapr_cas_pvr(uint32_t cur_pvr, bool explicit_match, uint32_t new_pvr) "=
current=3D0x%x, explicit_match=3D%u, new=3D0x%x"
 spapr_h_resize_hpt_prepare(uint64_t flags, uint64_t shift) "flags=3D0x%"=
PRIx64", shift=3D%"PRIu64
 spapr_h_resize_hpt_commit(uint64_t flags, uint64_t shift) "flags=3D0x%"P=
RIx64", shift=3D%"PRIu64
@@ -47,16 +44,13 @@ spapr_iommu_ddw_reset(uint64_t buid, uint32_t cfgaddr=
) "buid=3D0x%"PRIx64" addr=3D0x
 # spapr_drc.c
 spapr_drc_set_isolation_state(uint32_t index, int state) "drc: 0x%"PRIx3=
2", state: 0x%"PRIx32
 spapr_drc_set_isolation_state_finalizing(uint32_t index) "drc: 0x%"PRIx3=
2
-spapr_drc_set_isolation_state_deferring(uint32_t index) "drc: 0x%"PRIx32
 spapr_drc_set_dr_indicator(uint32_t index, int state) "drc: 0x%"PRIx32",=
 state: 0x%x"
 spapr_drc_set_allocation_state(uint32_t index, int state) "drc: 0x%"PRIx=
32", state: 0x%x"
 spapr_drc_set_allocation_state_finalizing(uint32_t index) "drc: 0x%"PRIx=
32
 spapr_drc_set_configured(uint32_t index) "drc: 0x%"PRIx32
-spapr_drc_set_configured_skipping(uint32_t index) "drc: 0x%"PRIx32", iso=
lated device"
 spapr_drc_attach(uint32_t index) "drc: 0x%"PRIx32
 spapr_drc_detach(uint32_t index) "drc: 0x%"PRIx32
 spapr_drc_awaiting_quiesce(uint32_t index) "drc: 0x%"PRIx32
-spapr_drc_awaiting_allocation(uint32_t index) "drc: 0x%"PRIx32
 spapr_drc_reset(uint32_t index) "drc: 0x%"PRIx32
 spapr_drc_realize(uint32_t index) "drc: 0x%"PRIx32
 spapr_drc_realize_child(uint32_t index, char *childname) "drc: 0x%"PRIx3=
2", child name: %s"
@@ -71,7 +65,6 @@ spapr_ovec_populate_dt(int byte, uint16_t vec_len, uint=
8_t entry) "encoding gues
 spapr_rtas_get_sensor_state_not_supported(uint32_t index, uint32_t type)=
 "sensor index: 0x%"PRIx32", type: %"PRIu32
 spapr_rtas_get_sensor_state_invalid(uint32_t index) "sensor index: 0x%"P=
RIx32
 spapr_rtas_ibm_configure_connector_invalid(uint32_t index) "DRC index: 0=
x%"PRIx32
-spapr_rtas_ibm_configure_connector_missing_fdt(uint32_t index) "DRC inde=
x: 0x%"PRIx32
=20
 # spapr_vio.c
 spapr_vio_h_reg_crq(uint64_t reg, uint64_t queue_addr, uint64_t queue_le=
n) "CRQ for dev 0x%" PRIx64 " registered at 0x%" PRIx64 "/0x%" PRIx64
@@ -105,4 +98,3 @@ ppc440_pcix_set_irq(int irq_num) "PCI irq %d"
 ppc440_pcix_update_pim(int idx, uint64_t size, uint64_t la) "Added windo=
w %d of size=3D0x%" PRIx64 " to CPU=3D0x%" PRIx64
 ppc440_pcix_update_pom(int idx, uint32_t size, uint64_t la, uint64_t pci=
a) "Added window %d of size=3D0x%x from CPU=3D0x%" PRIx64 " to PCI=3D0x%"=
 PRIx64
 ppc440_pcix_reg_read(uint64_t addr, uint32_t val) "addr 0x%" PRIx64 " =3D=
 0x%" PRIx32
-ppc440_pcix_reg_write(uint64_t addr, uint64_t val) "addr 0x%" PRIx64 " =3D=
 0x%" PRIx64
diff --git a/hw/sd/trace-events b/hw/sd/trace-events
index 543e339016..52971dc033 100644
--- a/hw/sd/trace-events
+++ b/hw/sd/trace-events
@@ -35,7 +35,6 @@ sdcard_app_command(const char *proto, const char *acmd_=
desc, uint8_t acmd, uint3
 sdcard_response(const char *rspdesc, int rsplen) "%s (sz:%d)"
 sdcard_powerup(void) ""
 sdcard_inquiry_cmd41(void) ""
-sdcard_set_enable(bool current_state, bool new_state) "%u -> %u"
 sdcard_reset(void) ""
 sdcard_set_blocklen(uint16_t length) "0x%03x"
 sdcard_inserted(bool readonly) "read_only: %u"
diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
index 0c38b0c224..2df0e5b114 100644
--- a/hw/vfio/trace-events
+++ b/hw/vfio/trace-events
@@ -16,7 +16,6 @@ vfio_msix_pba_disable(const char *name) " (%s)"
 vfio_msix_pba_enable(const char *name) " (%s)"
 vfio_msix_disable(const char *name) " (%s)"
 vfio_msix_fixup(const char *name, int bar, uint64_t start, uint64_t end)=
 " (%s) MSI-X region %d mmap fixup [0x%"PRIx64" - 0x%"PRIx64"]"
-vfio_msix_relo_cost(const char *name, int bar, uint64_t cost) " (%s) BAR=
 %d cost 0x%"PRIx64""
 vfio_msix_relo(const char *name, int bar, uint64_t offset) " (%s) BAR %d=
 offset 0x%"PRIx64""
 vfio_msi_enable(const char *name, int nr_vectors) " (%s) Enabled %d MSI =
vectors"
 vfio_msi_disable(const char *name) " (%s)"
diff --git a/nbd/trace-events b/nbd/trace-events
index 640f86a3b4..a6cca8fdf8 100644
--- a/nbd/trace-events
+++ b/nbd/trace-events
@@ -58,7 +58,6 @@ nbd_negotiate_options_flags(uint32_t flags) "Received c=
lient flags 0x%" PRIx32
 nbd_negotiate_options_check_magic(uint64_t magic) "Checking opts magic 0=
x%" PRIx64
 nbd_negotiate_options_check_option(uint32_t option, const char *name) "C=
hecking option %" PRIu32 " (%s)"
 nbd_negotiate_begin(void) "Beginning negotiation"
-nbd_negotiate_old_style(uint64_t size, unsigned flags) "advertising size=
 %" PRIu64 " and flags 0x%x"
 nbd_negotiate_new_style_size_flags(uint64_t size, unsigned flags) "adver=
tising size %" PRIu64 " and flags 0x%x"
 nbd_negotiate_success(void) "Negotiation succeeded"
 nbd_receive_request(uint32_t magic, uint16_t flags, uint16_t type, uint6=
4_t from, uint32_t len) "Got request: { magic =3D 0x%" PRIx32 ", .flags =3D=
 0x%" PRIx16 ", .type =3D 0x%" PRIx16 ", from =3D %" PRIu64 ", len =3D %"=
 PRIu32 " }"
@@ -72,5 +71,4 @@ nbd_co_send_extents(uint64_t handle, unsigned int exten=
ts, uint32_t id, uint64_t
 nbd_co_send_structured_error(uint64_t handle, int err, const char *errna=
me, const char *msg) "Send structured error reply: handle =3D %" PRIu64 "=
, error =3D %d (%s), msg =3D '%s'"
 nbd_co_receive_request_decode_type(uint64_t handle, uint16_t type, const=
 char *name) "Decoding type: handle =3D %" PRIu64 ", type =3D %" PRIu16 "=
 (%s)"
 nbd_co_receive_request_payload_received(uint64_t handle, uint32_t len) "=
Payload received: handle =3D %" PRIu64 ", len =3D %" PRIu32
-nbd_co_receive_request_cmd_write(uint32_t len) "Reading %" PRIu32 " byte=
(s)"
 nbd_trip(void) "Reading request"
diff --git a/util/trace-events b/util/trace-events
index d1309a9ccd..ddd7300743 100644
--- a/util/trace-events
+++ b/util/trace-events
@@ -36,7 +36,6 @@ qemu_coroutine_yield(void *from, void *to) "from %p to =
%p"
 qemu_coroutine_terminate(void *co) "self %p"
=20
 # qemu-coroutine-lock.c
-qemu_co_queue_run_restart(void *co) "co %p"
 qemu_co_mutex_lock_uncontended(void *mutex, void *self) "mutex %p self %=
p"
 qemu_co_mutex_lock_entry(void *mutex, void *self) "mutex %p self %p"
 qemu_co_mutex_lock_return(void *mutex, void *self) "mutex %p self %p"
@@ -78,5 +77,4 @@ qemu_vfio_find_mapping(void *s, void *p) "s %p host %p"
 qemu_vfio_new_mapping(void *s, void *host, size_t size, int index, uint6=
4_t iova) "s %p host %p size %zu index %d iova 0x%"PRIx64
 qemu_vfio_do_mapping(void *s, void *host, size_t size, uint64_t iova) "s=
 %p host %p size %zu iova 0x%"PRIx64
 qemu_vfio_dma_map(void *s, void *host, size_t size, bool temporary, uint=
64_t *iova) "s %p host %p size %zu temporary %d iova %p"
-qemu_vfio_dma_map_invalid(void *s, void *mapping_host, size_t mapping_si=
ze, void *host, size_t size) "s %p mapping %p %zu requested %p %zu"
 qemu_vfio_dma_unmap(void *s, void *host) "s %p host %p"
--=20
2.20.1

