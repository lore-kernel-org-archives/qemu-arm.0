Received: by 10.25.21.96 with SMTP id l93csp583587lfi;
        Thu, 23 Jun 2016 08:30:27 -0700 (PDT)
X-Received: by 10.237.53.115 with SMTP id b48mr42630036qte.67.1466695827052;
        Thu, 23 Jun 2016 08:30:27 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u68si597080qka.142.2016.06.23.08.30.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 Jun 2016 08:30:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37381 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bG6aI-00014n-8X
	for alex.bennee@linaro.org; Thu, 23 Jun 2016 11:30:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47985)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vilanova@ac.upc.edu>) id 1bG6Su-0001Tv-Uu
	for qemu-devel@nongnu.org; Thu, 23 Jun 2016 11:22:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vilanova@ac.upc.edu>) id 1bG6Ss-0006Vj-66
	for qemu-devel@nongnu.org; Thu, 23 Jun 2016 11:22:47 -0400
Received: from roura.ac.upc.es ([147.83.33.10]:37565)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vilanova@ac.upc.edu>)
	id 1bG6Sl-0006U1-BR; Thu, 23 Jun 2016 11:22:39 -0400
Received: from gw-2.ac.upc.es (gw-2.ac.upc.es [147.83.30.8])
	by roura.ac.upc.es (8.13.8/8.13.8) with ESMTP id u5NFLcNb001272;
	Thu, 23 Jun 2016 17:21:38 +0200
Received: from localhost (unknown [84.88.51.85])
	by gw-2.ac.upc.es (Postfix) with ESMTPSA id 5501A38D;
	Thu, 23 Jun 2016 17:21:38 +0200 (CEST)
From: =?utf-8?b?TGx1w61z?= Vilanova <vilanova@ac.upc.edu>
To: qemu-devel@nongnu.org
Date: Thu, 23 Jun 2016 17:21:38 +0200
Message-Id: <146669529801.625.6901560438412016215.stgit@fimbulvetr.bsc.es>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <146669528713.625.8876454915821379411.stgit@fimbulvetr.bsc.es>
References: <146669528713.625.8876454915821379411.stgit@fimbulvetr.bsc.es>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by roura.ac.upc.es id
	u5NFLcNb001272
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 147.83.33.10
Subject: [Qemu-devel] [PATCH v6 2/7] disas: Remove unused macro '_'
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"open list:ARM" <qemu-arm@nongnu.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"open list:PowerPC" <qemu-ppc@nongnu.org>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Alexander Graf <agraf@suse.de>, Blue Swirl <blauwirbel@gmail.com>,
	Leon Alrae <leon.alrae@imgtec.com>,
	"Vassili Karpov \(malc\)" <av1474@comtv.ru>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: g1Ojm4CLwf2N

Eliminates a future compilation error when UI code includes the tracing
headers (indirectly pulling "disas/bfd.h" through "qom/cpu.h") and
GLib's i18n '_' macro.

Signed-off-by: Llu=C3=ADs Vilanova <vilanova@ac.upc.edu>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 disas/alpha.c       |    6 +++---
 disas/arm.c         |    2 +-
 disas/i386.c        |    2 +-
 disas/m68k.c        |    4 ++--
 disas/mips.c        |   50 +++++++++++++++++++++++++--------------------=
-----
 disas/ppc.c         |   22 +++++++++++-----------
 disas/sparc.c       |    6 +++---
 include/disas/bfd.h |    1 -
 8 files changed, 46 insertions(+), 47 deletions(-)

diff --git a/disas/alpha.c b/disas/alpha.c
index 44d00a3..b7b0ae0 100644
--- a/disas/alpha.c
+++ b/disas/alpha.c
@@ -521,7 +521,7 @@ static unsigned
 insert_bdisp(unsigned insn, int value, const char **errmsg)
 {
   if (errmsg !=3D (const char **)NULL && (value & 3))
-    *errmsg =3D _("branch operand unaligned");
+    *errmsg =3D "branch operand unaligned";
   return insn | ((value / 4) & 0x1FFFFF);
 }
=20
@@ -539,7 +539,7 @@ static unsigned
 insert_jhint(unsigned insn, int value, const char **errmsg)
 {
   if (errmsg !=3D (const char **)NULL && (value & 3))
-    *errmsg =3D _("jump hint unaligned");
+    *errmsg =3D "jump hint unaligned";
   return insn | ((value / 4) & 0x3FFF);
 }
=20
@@ -556,7 +556,7 @@ static unsigned
 insert_ev6hwjhint(unsigned insn, int value, const char **errmsg)
 {
   if (errmsg !=3D (const char **)NULL && (value & 3))
-    *errmsg =3D _("jump hint unaligned");
+    *errmsg =3D "jump hint unaligned";
   return insn | ((value / 4) & 0x1FFF);
 }
=20
diff --git a/disas/arm.c b/disas/arm.c
index 70da529..32f8ca9 100644
--- a/disas/arm.c
+++ b/disas/arm.c
@@ -1817,7 +1817,7 @@ print_insn_coprocessor (bfd_vma pc, struct disassem=
ble_info *info, long given,
 			  func (stream, "e");
 			  break;
 			default:
-			  func (stream, _("<illegal precision>"));
+			  func (stream, "<illegal precision>");
 			  break;
 			}
 		      break;
diff --git a/disas/i386.c b/disas/i386.c
index c0e717a..57145d0 100644
--- a/disas/i386.c
+++ b/disas/i386.c
@@ -3406,7 +3406,7 @@ static const struct dis386 three_byte_table[][256] =
=3D {
   }
 };
=20
-#define INTERNAL_DISASSEMBLER_ERROR _("<internal disassembler error>")
+#define INTERNAL_DISASSEMBLER_ERROR "<internal disassembler error>"
=20
 static void
 ckprefix (void)
diff --git a/disas/m68k.c b/disas/m68k.c
index 8f74ae1..8e7c3f7 100644
--- a/disas/m68k.c
+++ b/disas/m68k.c
@@ -1676,7 +1676,7 @@ print_insn_arg (const char *d,
 	  (*info->fprintf_func) (info->stream, "%%sfc");
 	else
 	  /* xgettext:c-format */
-	  (*info->fprintf_func) (info->stream, _("<function code %d>"), fc);
+	  (*info->fprintf_func) (info->stream, "<function code %d>", fc);
       }
       break;
=20
@@ -1827,7 +1827,7 @@ match_insn_m68k (bfd_vma memaddr,
 	{
 	  info->fprintf_func (info->stream,
 			      /* xgettext:c-format */
-			      _("<internal error in opcode table: %s %s>\n"),
+			      "<internal error in opcode table: %s %s>\n",
 			      best->name,  best->args);
 	  info->fprintf_func =3D save_printer;
 	  info->print_address_func =3D save_print_address;
diff --git a/disas/mips.c b/disas/mips.c
index 249931b..97f661a 100644
--- a/disas/mips.c
+++ b/disas/mips.c
@@ -4257,7 +4257,7 @@ print_insn_args (const char *d,
 	    case '\0':
 	      /* xgettext:c-format */
 	      (*info->fprintf_func) (info->stream,
-				     _("# internal error, incomplete extension sequence (+)"));
+				     "# internal error, incomplete extension sequence (+)");
 	      return;
=20
 	    case 'A':
@@ -4515,7 +4515,7 @@ print_insn_args (const char *d,
 	    default:
 	      /* xgettext:c-format */
 	      (*info->fprintf_func) (info->stream,
-				     _("# internal error, undefined extension sequence (+%c)"),
+				     "# internal error, undefined extension sequence (+%c)",
 				     *d);
 	      return;
 	    }
@@ -4875,7 +4875,7 @@ print_insn_args (const char *d,
 	default:
 	  /* xgettext:c-format */
 	  (*info->fprintf_func) (info->stream,
-				 _("# internal error, undefined modifier(%c)"),
+				 "# internal error, undefined modifier(%c)",
 				 *d);
 	  return;
 	}
@@ -5739,7 +5739,7 @@ print_mips16_insn_arg (char type,
       /* xgettext:c-format */
       (*info->fprintf_func)
 	(info->stream,
-	 _("# internal disassembler error, unrecognised modifier (%c)"),
+	 "# internal disassembler error, unrecognised modifier (%c)",
 	 type);
       abort ();
     }
@@ -5750,51 +5750,51 @@ print_mips_disassembler_options (FILE *stream)
 {
   unsigned int i;
=20
-  fprintf (stream, _("\n\
+  fprintf (stream, "\n\
 The following MIPS specific disassembler options are supported for use\n=
\
-with the -M switch (multiple options should be separated by commas):\n")=
);
+with the -M switch (multiple options should be separated by commas):\n")=
;
=20
-  fprintf (stream, _("\n\
+  fprintf (stream, "\n\
   gpr-names=3DABI            Print GPR names according to  specified ABI=
.\n\
-                           Default: based on binary being disassembled.\=
n"));
+                           Default: based on binary being disassembled.\=
n");
=20
-  fprintf (stream, _("\n\
+  fprintf (stream, "\n\
   fpr-names=3DABI            Print FPR names according to specified ABI.=
\n\
-                           Default: numeric.\n"));
+                           Default: numeric.\n");
=20
-  fprintf (stream, _("\n\
+  fprintf (stream, "\n\
   cp0-names=3DARCH           Print CP0 register names according to\n\
                            specified architecture.\n\
-                           Default: based on binary being disassembled.\=
n"));
+                           Default: based on binary being disassembled.\=
n");
=20
-  fprintf (stream, _("\n\
+  fprintf (stream, "\n\
   hwr-names=3DARCH           Print HWR names according to specified\n\
 			   architecture.\n\
-                           Default: based on binary being disassembled.\=
n"));
+                           Default: based on binary being disassembled.\=
n");
=20
-  fprintf (stream, _("\n\
+  fprintf (stream, "\n\
   reg-names=3DABI            Print GPR and FPR names according to\n\
-                           specified ABI.\n"));
+                           specified ABI.\n");
=20
-  fprintf (stream, _("\n\
+  fprintf (stream, "\n\
   reg-names=3DARCH           Print CP0 register and HWR names according =
to\n\
-                           specified architecture.\n"));
+                           specified architecture.\n");
=20
-  fprintf (stream, _("\n\
+  fprintf (stream, "\n\
   For the options above, the following values are supported for \"ABI\":=
\n\
-   "));
+   ");
   for (i =3D 0; i < ARRAY_SIZE (mips_abi_choices); i++)
     fprintf (stream, " %s", mips_abi_choices[i].name);
-  fprintf (stream, _("\n"));
+  fprintf (stream, "\n");
=20
-  fprintf (stream, _("\n\
+  fprintf (stream, "\n\
   For the options above, The following values are supported for \"ARCH\"=
:\n\
-   "));
+   ");
   for (i =3D 0; i < ARRAY_SIZE (mips_arch_choices); i++)
     if (*mips_arch_choices[i].name !=3D '\0')
       fprintf (stream, " %s", mips_arch_choices[i].name);
-  fprintf (stream, _("\n"));
+  fprintf (stream, "\n");
=20
-  fprintf (stream, _("\n"));
+  fprintf (stream, "\n");
 }
 #endif
diff --git a/disas/ppc.c b/disas/ppc.c
index 478332b..052cebe 100644
--- a/disas/ppc.c
+++ b/disas/ppc.c
@@ -1120,7 +1120,7 @@ insert_bo (unsigned long insn,
 	   const char **errmsg)
 {
   if (!valid_bo (value, dialect, 0))
-    *errmsg =3D _("invalid conditional option");
+    *errmsg =3D "invalid conditional option";
   return insn | ((value & 0x1f) << 21);
 }
=20
@@ -1148,9 +1148,9 @@ insert_boe (unsigned long insn,
 	    const char **errmsg)
 {
   if (!valid_bo (value, dialect, 0))
-    *errmsg =3D _("invalid conditional option");
+    *errmsg =3D "invalid conditional option";
   else if ((value & 1) !=3D 0)
-    *errmsg =3D _("attempt to set y bit when using + or - modifier");
+    *errmsg =3D "attempt to set y bit when using + or - modifier";
=20
   return insn | ((value & 0x1f) << 21);
 }
@@ -1182,7 +1182,7 @@ insert_fxm (unsigned long insn,
     {
       if (value =3D=3D 0 || (value & -value) !=3D value)
 	{
-	  *errmsg =3D _("invalid mask field");
+	  *errmsg =3D "invalid mask field";
 	  value =3D 0;
 	}
     }
@@ -1208,7 +1208,7 @@ insert_fxm (unsigned long insn,
   /* Any other value on mfcr is an error.  */
   else if ((insn & (0x3ff << 1)) =3D=3D 19 << 1)
     {
-      *errmsg =3D _("ignoring invalid mfcr mask");
+      *errmsg =3D "ignoring invalid mfcr mask";
       value =3D 0;
     }
=20
@@ -1258,7 +1258,7 @@ insert_mbe (unsigned long insn,
=20
   if (uval =3D=3D 0)
     {
-      *errmsg =3D _("illegal bitmask");
+      *errmsg =3D "illegal bitmask";
       return insn;
     }
=20
@@ -1293,7 +1293,7 @@ insert_mbe (unsigned long insn,
     me =3D 32;
=20
   if (count !=3D 2 && (count !=3D 0 || ! last))
-    *errmsg =3D _("illegal bitmask");
+    *errmsg =3D "illegal bitmask";
=20
   return insn | (mb << 6) | ((me - 1) << 1);
 }
@@ -1413,7 +1413,7 @@ insert_ram (unsigned long insn,
 	    const char **errmsg)
 {
   if ((unsigned long) value >=3D ((insn >> 21) & 0x1f))
-    *errmsg =3D _("index register in load range");
+    *errmsg =3D "index register in load range";
   return insn | ((value & 0x1f) << 16);
 }
=20
@@ -1429,7 +1429,7 @@ insert_raq (unsigned long insn,
   long rtvalue =3D (insn & RT_MASK) >> 21;
=20
   if (value =3D=3D rtvalue)
-    *errmsg =3D _("source and target register operands must be different=
");
+    *errmsg =3D "source and target register operands must be different";
   return insn | ((value & 0x1f) << 16);
 }
=20
@@ -1444,7 +1444,7 @@ insert_ras (unsigned long insn,
 	    const char **errmsg)
 {
   if (value =3D=3D 0)
-    *errmsg =3D _("invalid register operand when updating");
+    *errmsg =3D "invalid register operand when updating";
   return insn | ((value & 0x1f) << 16);
 }
=20
@@ -1526,7 +1526,7 @@ insert_sprg (unsigned long insn,
   if (value > 7
       || (value > 3
 	  && (dialect & (PPC_OPCODE_BOOKE | PPC_OPCODE_403)) =3D=3D 0))
-    *errmsg =3D _("invalid sprg number");
+    *errmsg =3D "invalid sprg number";
=20
   /* If this is mfsprg4..7 then use spr 260..263 which can be read in
      user mode.  Anything else must use spr 272..279.  */
diff --git a/disas/sparc.c b/disas/sparc.c
index 64bba8d..f120f4e 100644
--- a/disas/sparc.c
+++ b/disas/sparc.c
@@ -2494,7 +2494,7 @@ compare_opcodes (const void * a, const void * b)
       fprintf
         (stderr,
          /* xgettext:c-format */
-         _("Internal error:  bad sparc-opcode.h: \"%s\", %#.8lx, %#.8lx\=
n"),
+         "Internal error:  bad sparc-opcode.h: \"%s\", %#.8lx, %#.8lx\n"=
,
          op0->name, match0, lose0);
       op0->lose &=3D ~op0->match;
       lose0 =3D op0->lose;
@@ -2505,7 +2505,7 @@ compare_opcodes (const void * a, const void * b)
       fprintf
         (stderr,
          /* xgettext:c-format */
-         _("Internal error: bad sparc-opcode.h: \"%s\", %#.8lx, %#.8lx\n=
"),
+         "Internal error: bad sparc-opcode.h: \"%s\", %#.8lx, %#.8lx\n",
          op1->name, match1, lose1);
       op1->lose &=3D ~op1->match;
       lose1 =3D op1->lose;
@@ -2555,7 +2555,7 @@ compare_opcodes (const void * a, const void * b)
       else
         fprintf (stderr,
                  /* xgettext:c-format */
-                 _("Internal error: bad sparc-opcode.h: \"%s\" =3D=3D \"=
%s\"\n"),
+                 "Internal error: bad sparc-opcode.h: \"%s\" =3D=3D \"%s=
\"\n",
                  op0->name, op1->name);
     }
=20
diff --git a/include/disas/bfd.h b/include/disas/bfd.h
index a112e9c..a761d5b 100644
--- a/include/disas/bfd.h
+++ b/include/disas/bfd.h
@@ -477,7 +477,6 @@ int generic_symbol_at_address(bfd_vma, struct disasse=
mble_info *);
   (INFO).disassembler_options =3D NULL, \
   (INFO).insn_info_valid =3D 0
=20
-#define _(x) x
 #define ATTRIBUTE_UNUSED __attribute__((unused))
=20
 /* from libbfd */

